import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:bright_impact/state/list_provider/project_list_provider.dart';
import 'package:bright_impact/view/custom_widgets/project_card_widget.dart';
import 'package:bright_impact/view/pages/list_pages/list_page.dart';
import 'package:bright_impact/view/pages/project_detail_page.dart';
import 'package:flutter/material.dart';

class ProjectListPage extends ListPage<Project> {
  const ProjectListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectListPageState();

  @override
  ListProvider<Project> createProvider() => ProjectListProvider();

  @override
  String pageTitle() => "Unsere Projekte";

  @override
  List<FilterButtonConfig> filterConfig(ListProvider<Project> provider) {
    final projectProvider = provider as ProjectListProvider;
    return [
      FilterButtonConfig(
        label: "♡ Favoriten",
        isActive: projectProvider.filterIsFavorite,
        onTap: () => projectProvider.setFilterAndFetch(
            isFavorite: !projectProvider.filterIsFavorite),
      ),
      FilterButtonConfig(
        label: "Gespendet",
        isActive: projectProvider.filterDonatedTo,
        onTap: () => projectProvider.setFilterAndFetch(
            donatedTo: !projectProvider.filterDonatedTo,
            includeArchived: !projectProvider.filterDonatedTo),
      ),
      FilterButtonConfig(
        label: "Neuste ↑",
        isActive: projectProvider.sortNewest,
        onTap: () => projectProvider.setFilterAndFetch(
            newest: !projectProvider.sortNewest),
      ),
    ];
  }

  @override
  Future<void> onItemPressed(
      BuildContext context, ListProvider<Project> provider, int index) async {
    openDetailSheet(
        context, ProjectDetailSheet(projectId: provider.entries[index].id));
  }

  @override
  Widget buildListEntry(
      {required Project item,
      required int index,
      required BuildContext context,
      void Function()? onPressed}) {
    //final width = MediaQuery.of(context).size.width;
    //final theme = Theme.of(context);
    /*return Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(item.bannerUri),
              backgroundColor: const Color.fromARGB(255, 209, 209, 209),
              radius: width * 0.2,
            ),
            SizedBox(height: width * 0.02),
            Text(
              item.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.secondaryHeaderColor),
            ),
          ],
        ));*/

    return GestureDetector(
        onTap: onPressed,
        child: ProjectCardWidget(
            title: item.name,
            subtitle: item.ngoName,
            imageUri: item.bannerUri));
  }
}

class _ProjectListPageState extends ListPageState<Project, ProjectListPage> {}
