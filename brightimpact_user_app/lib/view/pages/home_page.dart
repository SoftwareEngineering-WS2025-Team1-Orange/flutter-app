import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:bright_impact/state/list_provider/project_list_provider.dart';
import 'package:bright_impact/view/custom_widgets/donationbox_status_widget.dart';
import 'package:bright_impact/view/custom_widgets/project_card_widget.dart';
import 'package:bright_impact/view/pages/detail_pages/project_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin {
  // Keeps page alive when not visible in PageView
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);

    final appState = Provider.of<AppState>(context);
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DonationboxProvider>(
            create: (_) => DonationboxProvider(
              donatorId: appState.donator?.id ?? 0,
              // entity id is 0 since all Boxes are fetched in a list
            )..setIdAndFetch(0),
          ),
        ],
        child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Stack(children: [
          RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async {
                await ListProvider.refreshAllListPages<Project>();
              }, // Pull-to-Refresh
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: width * 0.5),
                    DonationboxStatusWidget(),
                    _buildProjectSection(
                        context, "Kürzlich hinzugefügte Projekte", null,
                        hideOnLoading: false),
                    _buildProjectSection(context, "Umwelt und Nachhaltigkeit",
                        ProjectCategoryDto.environment),
                    _buildProjectSection(context, "Schule und Bildung",
                        ProjectCategoryDto.education),
                    _buildProjectSection(context, "Menschenrechte",
                        ProjectCategoryDto.humanRights),
                    _buildProjectSection(
                        context, "Gesundheit", ProjectCategoryDto.health),
                    _buildProjectSection(
                        context, "Tierwohl", ProjectCategoryDto.animalRights),
                    SizedBox(height: width * 0.25),
                  ],
                ),
              )),
        ])));
  }

  Widget _buildProjectSection(
      BuildContext context, String title, ProjectCategoryDto? filterCategory,
      {bool hideOnLoading = true}) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);

    return ChangeNotifierProvider(
        create: (context) => ProjectListProvider(
            resultsPerPage: 7, donatorId: appState.donator?.id ?? 0)
          ..setFilterAndFetch(category: filterCategory, newest: true),
        child:
            Consumer<ProjectListProvider>(builder: (context, provider, child) {
          return hideOnLoading &&
                  (provider.isLoading || provider.entries.isEmpty)
              ? SizedBox()
              : SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      if (provider.isLoading)
                        Center(
                            child: CircularProgressIndicator(
                          color: theme.primaryColor,
                        )),
                      if (provider.loadingError != null)
                        Center(
                            child: Text(
                                "Hoppla! ${provider.loadingError!.message}")),
                      if (!provider.isLoading && provider.loadingError == null)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ] +
                                  _buildProjectCards(context, provider) +
                                  [
                                    SizedBox(
                                      width: width * 0.05,
                                    )
                                  ]),
                        ),
                      SizedBox(height: 16),
                    ],
                  ));
        }));
  }

  List<SizedBox> _buildProjectCards(
      BuildContext context, ProjectListProvider provider) {
    final width = MediaQuery.of(context).size.width;
    return provider.entries
        .map((e) => SizedBox(
            width: width * 0.7,
            height: width * 0.55,
            child: GestureDetector(
                onTap: () =>
                    ProjectDetailSheet(id: e.id)..openDetailSheet(context),
                child: ProjectCardWidget(
                  title: e.name,
                  subtitle: e.ngoName,
                  imageUri: e.bannerUri,
                  isFavorite: e.isFavorite,
                ))))
        .toList();
  }
}
