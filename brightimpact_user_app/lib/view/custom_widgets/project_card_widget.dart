import 'package:flutter/material.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUri;
  final bool isFavorite;

  const ProjectCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUri,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                    child: Image.network(
                      imageUri,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                color: Colors.grey[700],
                                height: 1.3,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            // Favorite Button
            if (isFavorite)
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: EdgeInsets.all(7),
                    child: ClipOval(
                        child: Container(
                            color: theme.primaryColor,
                            child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Icon(
                                  size: 25,
                                  Icons.favorite,
                                  color: Colors.white,
                                )))))
              ])
          ],
        ));
  }
}
