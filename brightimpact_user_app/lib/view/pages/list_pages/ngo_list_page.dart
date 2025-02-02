import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:bright_impact/state/list_provider/ngo_list_provider.dart';
import 'package:bright_impact/view/pages/list_pages/list_page.dart';
import 'package:bright_impact/view/pages/detail_pages/ngo_detail_page.dart';
import 'package:flutter/material.dart';

class NGOListPage extends ListPage<NGO> {
  const NGOListPage({super.key});

  @override
  State<StatefulWidget> createState() => _NGOListPageState();

  @override
  ListProvider<NGO> createProvider({required int donatorId}) =>
      NgoListProvider(donatorId: donatorId);

  @override
  String pageTitle() => "Gemeinnützige Organisationen";

  @override
  List<FilterButtonConfig> filterConfig(ListProvider<NGO> provider) {
    final ngoProvider = provider as NgoListProvider;
    return [
      FilterButtonConfig(
        label: "♡ Favoriten",
        isActive: ngoProvider.filterIsFavorite,
        onTap: () => ngoProvider.setFilterAndFetch(
            isFavorite: !ngoProvider.filterIsFavorite),
      ),
      FilterButtonConfig(
        label: "Gespendet",
        isActive: ngoProvider.filterDonatedTo,
        onTap: () => ngoProvider.setFilterAndFetch(
            donatedTo: !ngoProvider.filterDonatedTo),
      ),
      FilterButtonConfig(
        label: "Neuste ↑",
        isActive: ngoProvider.sortNewest,
        onTap: () =>
            ngoProvider.setFilterAndFetch(newest: !ngoProvider.sortNewest),
      ),
    ];
  }

  @override
  Future<void> onItemPressed(
      BuildContext context, ListProvider<NGO> provider, int index) async {
    final ngo = provider.entries[index];
    NgoDetailSheet(id: ngo.id).openDetailSheet(context);
  }

  @override
  Widget buildListEntry(
      {required NGO item,
      required int index,
      required BuildContext context,
      void Function()? onPressed}) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            GestureDetector(
                onTap: onPressed,
                child: Stack(children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(item.bannerUri),
                    backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                    radius: width * 0.2,
                  ),
                ])),
            SizedBox(height: width * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                item.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.secondaryHeaderColor),
              ),
              if (item.isFavorite)
                Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: ClipOval(
                        child: Container(
                            color: theme.primaryColor,
                            child: Padding(
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  size: 12,
                                  Icons.favorite,
                                  color: Colors.white,
                                )))))
            ])
          ],
        ));
  }
}

class _NGOListPageState extends ListPageState<NGO, NGOListPage> {}
