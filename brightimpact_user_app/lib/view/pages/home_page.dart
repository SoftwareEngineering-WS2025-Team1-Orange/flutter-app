import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/list_provider/project_list_provider.dart';
import 'package:bright_impact/view/custom_widgets/project_card_widget.dart';
import 'package:bright_impact/view/custom_widgets/rotating_circle_widget.dart';
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

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Stack(children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.5),
                _buildDonationBoxStatusSection(context),
                _buildProjectSection(
                    context, "Kürzlich hinzugefügte Projekte", null,
                    hideOnLoading: false),
                _buildProjectSection(context, "Umwelt und Nachhaltigkeit",
                    ProjectCategoryDto.environment),
                _buildProjectSection(context, "Schule und Bildung",
                    ProjectCategoryDto.education),
                _buildProjectSection(
                    context, "Menschenrechte", ProjectCategoryDto.humanRights),
                _buildProjectSection(
                    context, "Gesundheit", ProjectCategoryDto.health),
                _buildProjectSection(
                    context, "Tierwohl", ProjectCategoryDto.animalRights),
                SizedBox(height: width * 0.25),
              ],
            ),
          ),
        ]));
  }

  Widget _buildDonationBoxStatusSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Donation Box',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 8),
          Text(
            'active',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child:
                      _buildStatusItem("27 Watt", null, Icons.bolt, context)),
              SizedBox(width: 10),
              Expanded(
                  child: _buildStatusItem(
                      "0,05 €", "Ø/Tag", Icons.euro, context,
                      animationReversed: true)),
              SizedBox(width: 10),
              Expanded(
                  child: _buildStatusItem(
                      "17%", "Active Time", Icons.timer, context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(
      String label, String? subtitle, IconData icon, BuildContext context,
      {bool animationReversed = false}) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              color: theme.secondaryHeaderColor,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.all(constraints.maxHeight * 0.1),
                    child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          label,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (subtitle != null)
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              color: theme.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Icon(
                        icon,
                        color: theme.primaryColor,
                        size: constraints.maxHeight *
                            0.2,
                      ),
                    ],
                  ));
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: RotatingCircle(
            gaps: 3,
            color: theme.primaryColor,
            reversed: animationReversed,
          ),
        ),
      ],
    );
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
                    isFavorite: e.isFavorite,))))
        .toList();
  }
}
