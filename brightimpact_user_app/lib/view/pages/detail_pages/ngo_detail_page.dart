import 'package:bright_impact/state/entity_provider/ngo_provider.dart';
import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:bright_impact/view/pages/detail_pages/detail_page.dart';
import 'package:bright_impact/view/pages/donation_page.dart';
import 'package:flutter/material.dart';

class NgoDetailSheet extends DetailSheet<NGO, NgoProvider> {
  const NgoDetailSheet({super.key, required super.id});

  @override
  DetailsPage<NGO, NgoProvider> createPage(
          {required int id, required ScrollController scrollController}) =>
      NgoDetailsPage(id: id, scrollController: scrollController);
}

class NgoDetailsPage extends DetailsPage<NGO, NgoProvider> {
  const NgoDetailsPage({
    super.key,
    required super.id,
    required super.scrollController,
  });

  @override
  NgoProvider createProvider({required int donatorId}) =>
      NgoProvider(donatorId: donatorId);

  @override
  List<Widget> buildBottomButtons(BuildContext context, NgoProvider provider) {
    final theme = Theme.of(context);

    return [
      ButtonWidget(
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
                  targetSubtitle: "Spende an Organisation",
                  isNgo: true,
                  targetEntityId: provider.entity?.id ?? 0,
                ),
              ),
            );
            return Future.value(true);
          }),
      if (provider.entity?.websiteUrl?.isNotEmpty ??
          false) // when not null and not empty
        ElevatedButton(
          onPressed: () => openWebsite(provider.entity!.websiteUrl!),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: theme.secondaryHeaderColor,
            padding: EdgeInsets.all(16),
          ),
          child: Icon(
            Icons.public,
            color: Colors.white,
          ),
        ),
    ];
  }

  @override
  Widget buildMainContent(
      BuildContext context, NgoProvider provider, NGO entity) {
    final screenWidth = MediaQuery.of(context).size.width;

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
          SizedBox(height: screenWidth * 0.1),
          Text(entity.description),
          SizedBox(height: screenWidth * 0.3),
        ],
      ),
    );
  }

  @override
  Widget buildTopImageWidget(BuildContext context, NgoProvider provider) {
    final entity = provider.entity;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
                  child: Center(
                      child: CircleAvatar(
                    backgroundImage:
                        entity != null ? NetworkImage(entity.bannerUri) : null,
                    backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                    radius: screenWidth * 0.3,
                  )))),
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
