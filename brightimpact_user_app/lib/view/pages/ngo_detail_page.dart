import 'package:bright_impact/State/ngo_provider.dart';
import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/view/pages/detail_page.dart';
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
  NgoProvider createProvider() => NgoProvider();

  @override
  List<Widget> buildBottomButtons(BuildContext context, NgoProvider provider) {
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
          )),
      if (provider.entity?.websiteUrl != null)
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
