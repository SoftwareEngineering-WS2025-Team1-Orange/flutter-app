import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/entity_provider/project_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:bright_impact/view/pages/detail_pages/detail_page.dart';
import 'package:bright_impact/view/pages/donation_page.dart';
import 'package:flutter/material.dart';

class ProjectDetailSheet extends DetailSheet<Project, ProjectProvider> {
  const ProjectDetailSheet({super.key, required super.id});

  @override
  DetailsPage<Project, ProjectProvider> createPage(
          {required int id, required ScrollController scrollController}) =>
      ProjectDetailsPage(id: id, scrollController: scrollController);
}

class ProjectDetailsPage extends DetailsPage<Project, ProjectProvider> {
  const ProjectDetailsPage({
    super.key,
    required super.id,
    required super.scrollController,
  });

  @override
  ProjectProvider createProvider({required int donatorId}) =>
      ProjectProvider(donatorId: donatorId);

  @override
  List<Widget> buildBottomButtons(
      BuildContext context, ProjectProvider provider) {
    final screenWidth = MediaQuery.of(context).size.width;

    return [
      SizedBox(
          width: screenWidth * 0.55,
          child: ButtonWidget(
            labelText: "Spenden",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Ermöglicht volle Höhe
                backgroundColor: Colors.transparent,
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.875, // Sheet only takes 90% of screen height
                  child: DonationPage(
                      targetTitle: provider.entity?.name ?? "",
                      targetSubtitle: provider.entity?.ngoName ?? "",
                      isNgo: false,
                      targetEntityId: provider.id ?? 0),
                ),
              );
              return Future.value(true);
            },
          ))
    ];
  }

  @override
  Widget buildMainContent(
      BuildContext context, ProjectProvider provider, Project entity) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.name,
            style: TextStyle(
                fontSize: screenWidth * 0.073,
                fontWeight: FontWeight.w700,
                height: 1),
          ),
          const SizedBox(height: 4),
          Text(
            entity.ngoName,
            style: TextStyle(
              fontSize: screenWidth * 0.055,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Projektfortschritt: ${entity.progress.round()}%",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          SizedBox(
            height: screenWidth * 0.012,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                  color: theme.primaryColor,
                  backgroundColor: const Color.fromARGB(40, 0, 0, 0),
                  value: entity.progress / 100),
            ),
          ),
          SizedBox(height: screenWidth * 0.05),
          Center(
              child: Text(
            "Erzielte Spenden: ${entity.fundraisingCurrent.round()} €",
            style: theme.textTheme.titleMedium,
          )),
          SizedBox(height: screenWidth * 0.02),
          SizedBox(
              height: screenWidth * 0.012,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: LinearProgressIndicator(
                  color: theme.secondaryHeaderColor,
                  backgroundColor: const Color.fromARGB(40, 0, 0, 0),
                  value: entity.fundraisingCurrent / entity.fundraisingGoal,
                ),
              )),
          SizedBox(height: screenWidth * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0 €", style: theme.textTheme.labelMedium),
              Text("${entity.fundraisingGoal.round()} €",
                  style: theme.textTheme.labelMedium)
            ],
          ),
          SizedBox(height: screenWidth * 0.1),
          Text(entity.description),
          SizedBox(height: screenWidth * 0.3),
        ],
      ),
    );
  }

  @override
  Widget buildTopImageWidget(BuildContext context, ProjectProvider provider) {
    final entity = provider.entity;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
              color: Colors.grey[300],
              child: entity != null
                  ? Image.network(
                      entity.bannerUri,
                      width: screenWidth,
                      height: screenWidth * 0.65,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: screenWidth,
                      height: screenWidth * 0.65,
                    )),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: ElevatedButton(
            // Toggle favorite state
            onPressed: () async {
              if(await provider.setFavorite(!(entity?.isFavorite ?? false))) {
                // On Success: Refresh all Project Lists
                ListProvider.refreshAllListPages<Project>();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: const Color.fromARGB(255, 238, 236, 236),
              padding: EdgeInsets.all(16),
            ),
            child: Icon(
              entity?.isFavorite ?? false
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
