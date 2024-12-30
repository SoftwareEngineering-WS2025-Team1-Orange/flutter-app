import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/project_provider.dart';
import 'package:bright_impact/view/pages/detail_page.dart';
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
  ProjectProvider createProvider() => ProjectProvider();

  @override
  List<Widget> buildBottomButtons(
      BuildContext context, ProjectProvider provider) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return [
      SizedBox(
          width: screenWidth * 0.55,
          child: ElevatedButton(
            onPressed: () {
              // Navigation zu Spenden-Seite
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
            ),
            child: Center(
                child: Text(
              "Donate",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: theme.secondaryHeaderColor,
              ),
            )),
          ))
    ];
  }

  @override
  Widget buildMainContent(
      BuildContext context, ProjectProvider provider, Project entity) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.name,
            style: TextStyle(
              fontSize: screenWidth * 0.075,
              fontWeight: FontWeight.w700,
            ),
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
            onPressed: () => provider.toggleFavorite(),
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
