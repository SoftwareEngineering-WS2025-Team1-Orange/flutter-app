import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectDetailSheet extends StatefulWidget {
  final int projectId;

  const ProjectDetailSheet({super.key, required this.projectId});

  @override
  State<ProjectDetailSheet> createState() => _ProjectDetailSheetState();
}

class _ProjectDetailSheetState extends State<ProjectDetailSheet> {
  final double initialExtent = 0.9;
  final double minExtent = 0.7;
  final double maxExtent = 1.0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: maxExtent,
      minChildSize: minExtent,
      maxChildSize: maxExtent,
      snap: true, // Aktiviert Snap-Punkte
      snapSizes: [maxExtent],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
            /*boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, -2),
              ),
            ],*/
          ),
          child: ProjectDetailsPage(
            projectId: widget.projectId,
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}

class ProjectDetailsPage extends StatelessWidget {
  final int projectId;
  final ScrollController scrollController;

  const ProjectDetailsPage({
    super.key,
    required this.projectId,
    required this.scrollController,
  });

  Future<void> _openWebsite(String? url) async {
    if (url != null) {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Konnte die URL nicht öffnen: $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return ChangeNotifierProvider<ProjectProvider>(
      create: (_) => ProjectProvider()..setIdAndFetch(projectId),
      child: Consumer<ProjectProvider>(
        builder: (context, provider, child) {
          final project = provider.entity;

          return Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    child: Container(
                      color: Colors.white
                    ))
              ],
            ),
            SingleChildScrollView(
              //physics: ClampingScrollPhysics(),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 0.2,
                  ),
                  // RUNDES BILD
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30)),
                        child: Container(
                            color: Colors.grey[300],
                            child: project != null
                                ? Image.network(
                                    project.bannerUri,
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
                        child: IconButton(
                          icon: Icon(
                            project?.isFavorite ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: (project?.isFavorite ?? false)
                                ? Colors.red
                                : Colors.white,
                          ),
                          onPressed: () {
                            provider.toggleFavorite();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    child: _handleLoadingState(
                        context: context,
                        provider: provider,
                        mainContent: (project) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.name,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.075,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    project.ngoName,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.055,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Center(
                                    child: Text(
                                      "Project Progress: ${project.progress.round()}%",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.02),
                                  SizedBox(
                                    height: screenWidth * 0.012,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                          color: theme.primaryColor,
                                          value: project.progress / 100),
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.05),
                                  Center(
                                      child: Text(
                                    "Fund Raising: ${project.fundraisingCurrent.round()} €",
                                    style: theme.textTheme.titleMedium,
                                  )),
                                  SizedBox(height: screenWidth * 0.02),
                                  SizedBox(
                                      height: screenWidth * 0.012,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        child: LinearProgressIndicator(
                                          color: theme.secondaryHeaderColor,
                                          value: project.fundraisingCurrent /
                                              project.fundraisingGoal,
                                        ),
                                      )),
                                  SizedBox(height: screenWidth * 0.01),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("0 €",
                                          style: theme.textTheme.labelMedium),
                                      Text(
                                          "${project.fundraisingGoal.round()} €",
                                          style: theme.textTheme.labelMedium)
                                    ],
                                  ),
                                  SizedBox(height: screenWidth * 0.1),
                                  Text(project.description),
                                  /*SizedBox(height: screenWidth * 0.05),
                          GestureDetector(
                            onTap: () {
                              // Navigation zu NGO-Seite
                            },
                            child: Center(
                              child: Text("Website von ${project.ngoName}",
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  )),
                            ),
                          ),*/
                                  SizedBox(height: screenWidth * 0.3),
                                ],
                              ),
                            )),
                  )
                ],
              ),
            ),
            Center(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.1),
                  child: SizedBox(
                      height: screenWidth * 0.13,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*ElevatedButton(
                          onPressed: () => _openWebsite("http://example.org"),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          backgroundColor: theme.secondaryHeaderColor,
                            padding:
                                EdgeInsets.all(16),
                          ),
                          child: Icon(Icons.public, color: Colors.white,),
                        ),*/
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
                          ])))
            ])),
          ]);
        },
      ),
    );
  }

  Widget _handleLoadingState(
      {required BuildContext context,
      required ProjectProvider provider,
      required Widget Function(Project project) mainContent}) {
    final theme = Theme.of(context);
    final project = provider.entity;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final factorHeight = 0.6;

    if (provider.isLoading) {
      return SizedBox(
          width: screenWidth,
          height: screenHeight * factorHeight,
          child: Center(
              child: CircularProgressIndicator(
            color: theme.primaryColor,
          )));
    }

    if (provider.loadingError != null) {
      return SizedBox(
          width: screenWidth,
          height: screenHeight * factorHeight,
          child: Center(
            child: Text(
              provider.loadingError!.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ));
    }

    if (project == null) {
      return SizedBox(
          width: screenWidth,
          height: screenHeight * factorHeight,
          child: Center(child: Text("No project data available.")));
    }

    return mainContent(project);
  }
}
