import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterButtonConfig {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  FilterButtonConfig({
    required this.label,
    required this.isActive,
    required this.onTap,
  });
}

abstract class ListPage<T> extends StatefulWidget {

  const ListPage({super.key});

  /// Override to provide a list of filter configs that will be displayed as filter buttons to the user
  List<FilterButtonConfig> filterConfig(ListProvider<T> provider);

  /// Override to provide an instance of a subclass of ListProvider
  ListProvider<T> createProvider({required int donatorId});

  /// Override to set a title for the page
  String pageTitle() {
    return "";
  }

  /// Override to define Widget that represents an item of the list
  Widget buildListEntry(
      {required T item,
      required int index,
      required BuildContext context,
      void Function() onPressed});

  /// Override to receive tapped item events
  Future<void> onItemPressed(
      BuildContext context, ListProvider<T> provider, int index);
}

abstract class ListPageState<T, W extends ListPage<T>> extends State<W>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  late final ListProvider<T> _provider;

  // Prevents reloading of page when not visible
  @override
  bool get wantKeepAlive => true;

  ListProvider<T> createProvider({required int donatorId}) {
    _provider = widget.createProvider(donatorId: donatorId);
    _provider.fetchFirstPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 60 >=
              _scrollController.position.maxScrollExtent &&
          _provider.hasMore &&
          !_provider.isLoading) {
        _provider.fetchNextPage();
      }
    });

    return _provider;
  }

  Future<void> fetchFirstPage() async {
    await _provider.fetchFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final appState = Provider.of<AppState>(context);

    return ChangeNotifierProvider(
        create: (context) =>
            createProvider(donatorId: appState.donator?.id ?? 0),
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 228, 228, 228),
            body:
                Consumer<ListProvider<T>>(builder: (context, provider, child) {
              return Column(
                children: [
                  SizedBox(height: width * 0.5 + 20),
                  Text(
                    widget.pageTitle(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: theme.secondaryHeaderColor),
                  ),
                  // Filter Buttons
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget
                          .filterConfig(_provider)
                          .map((config) => _buildFilterButton(
                                label: config.label,
                                isActive: config.isActive,
                                onTap: config.onTap,
                                context: context,
                              ))
                          .toList(),
                    ),
                  ),
                  // NGO List
                  Expanded(
                      child: RefreshIndicator(
                    color: theme.primaryColor,
                    onRefresh: () =>
                        provider.fetchFirstPage(), // Pull-to-Refresh
                    child: provider.loadingError != null ||
                            provider.entries.isEmpty
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(
                                top: height * 0.25, bottom: height * 0.45),
                            child: Center(
                                child: !provider.isLoading
                                    ? Text(provider.loadingError != null
                                        ? "Hoppla! ${provider.loadingError!.message}"
                                        : "Keine Einträge gefunden.")
                                    : CircularProgressIndicator(
                                        color: theme.primaryColor)))
                        : ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: width * 0.25),
                            controller: _scrollController,
                            itemCount: provider.entries.length +
                                (provider.hasMore && provider.entries.isNotEmpty
                                    ? 1
                                    : 0),
                            itemBuilder: (context, index) {
                              if (index == provider.entries.length) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: theme.primaryColor,
                                ));
                              }

                              return widget.buildListEntry(
                                  item: provider.entries[index],
                                  index: index,
                                  context: context,
                                  onPressed: () => widget.onItemPressed(
                                      context, provider, index));
                            },
                          ),
                  )),
                ],
              );
            })));
  }

  Widget _buildFilterButton(
      {required String label,
      required bool isActive,
      required VoidCallback onTap,
      required BuildContext context}) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isActive ? theme.primaryColor : Color.fromARGB(20, 0, 0, 0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
