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
  ListProvider<T> createProvider();

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
  Future<void> onItemPressed(BuildContext context, ListProvider<T> provider, int index);
}

abstract class ListPageState<T, W extends ListPage<T>> extends State<W> {
  final ScrollController _scrollController = ScrollController();
  late final ListProvider<T> _provider;

  @override
  void initState() {
    super.initState();
    _provider = widget.createProvider();
    _provider.fetchFirstPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 60 >=
              _scrollController.position.maxScrollExtent &&
          _provider.hasMore &&
          !_provider.isLoading) {
        _provider.fetchNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (context) => _provider,
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
                        provider.fetchFirstPage(), // Pull-to-Refresh auslösen
                    child: provider.loadingError != null ||
                            provider.entries.isEmpty
                        ? Center(
                            child: !provider.isLoading
                                ? Text(provider.loadingError != null
                                    ? "Hoppla! ${provider.loadingError!.message}"
                                    : "Keine Einträge gefunden.")
                                : CircularProgressIndicator(
                                    color: theme.primaryColor))
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
                                  onPressed: () => widget.onItemPressed(context, provider, index));
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
