import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/controller/search.dart';
import 'package:personal_website/models/search_bar_item.dart';

class MobileSearchDelegate extends SearchDelegate {
  final List<SearchBarItem> Function(String text) onUpdate;
  final void Function(String text) onClose;

  MobileSearchDelegate({
    required this.onUpdate,
    required this.onClose,
    required String searchFieldLabel,
  }) : super(searchFieldLabel: searchFieldLabel);

  static show(BuildContext context) {
    final SearchController searchController = SearchController.to;
    final MobileSearchDelegate delegate = MobileSearchDelegate(
      onUpdate: searchController.search,
      onClose: searchController.updateLastSearch,
      searchFieldLabel: 'search'.tr,
    );
    showSearch(
      context: context,
      delegate: delegate,
      query: searchController.lastSearch,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.clear),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
    icon: const Icon(Icons.arrow_back),
  );

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<SearchBarItem> suggestions;
    if (query.isNotEmpty) {
      // suggestions = searchController.search(query);
      suggestions = onUpdate(query);
    } else {
      suggestions = [];
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final SearchBarItem item = suggestions[index];

        return ListTile(
          leading: Icon(item.icon),
          title: Text('${item.text} • ${item.category.tr}'),
          onTap: () {
            item.onTap();
          },
        );
      },
    );
  }

  @override
  void close(BuildContext context, result) {
    onClose(query);
    // searchController.updateLastSearch(query);
    super.close(context, result);
  }
}