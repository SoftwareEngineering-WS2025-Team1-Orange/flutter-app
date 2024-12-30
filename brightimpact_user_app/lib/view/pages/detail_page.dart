import 'package:bright_impact/state/entity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DetailSheet<T, W extends EntityProvider<T>>
    extends StatefulWidget {
  final int id;

  const DetailSheet({super.key, required this.id});

  @override
  State<DetailSheet<T, W>> createState() => _DetailSheetState<T, W>();

  DetailsPage<T, W> createPage(
      {required int id, required ScrollController scrollController});

  /// Opens detailPage using showModelBottomSheet
  void openDetailSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return this;
      },
    );
  }
}

class _DetailSheetState<T, W extends EntityProvider<T>>
    extends State<DetailSheet<T, W>> {
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
          ),
          child: widget.createPage(
              id: widget.id, scrollController: scrollController),
        );
      },
    );
  }
}

abstract class DetailsPage<T, W extends EntityProvider<T>>
    extends StatelessWidget {
  final int id;
  final ScrollController scrollController;

  const DetailsPage({
    super.key,
    required this.id,
    required this.scrollController,
  });

  Future<void> openWebsite(String? url) async {
    if (url != null) {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Konnte die URL nicht öffnen: $url';
      }
    }
  }

  /// Override to provide an instance of a subclass of EntityProvider
  W createProvider();

  /// Override to build top image widget. This widget will be displayed independed of the laoding state of the providers
  Widget buildTopImageWidget(BuildContext context, W provider);

  /// Override
  Widget buildMainContent(BuildContext context, W provider, T entity);

  /// Override to build buttons that have a fixed position at the bottom of the page and are aligned in a row
  List<Widget> buildBottomButtons(BuildContext context, W provider);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<W>(
      create: (_) => createProvider()..setIdAndFetch(id),
      child: Consumer<W>(
        builder: (context, provider, child) {
          return Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    child: Container(color: Colors.white))
              ],
            ),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 0.2,
                  ),
                  SizedBox(width: screenWidth, child: 
                  buildTopImageWidget(context, provider)),
                  SizedBox(width: screenWidth, child: 
                  Container(
                      color: Colors.white,
                      child: _handleLoadingState(
                        context: context,
                        provider: provider,
                        mainContent: (entity) =>
                            buildMainContent(context, provider, entity),
                      )))
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
                          children: buildBottomButtons(context, provider))))
            ])),
          ]);
        },
      ),
    );
  }

  Widget _handleLoadingState(
      {required BuildContext context,
      required W provider,
      required Widget Function(T entity) mainContent}) {
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
          child: Center(child: Text("No data available.")));
    }

    return mainContent(project);
  }
}
