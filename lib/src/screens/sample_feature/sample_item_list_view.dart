// sample_item_list_view.dart

import 'package:common_loading_skeleton/src/services/sample_item_service.dart';
import 'package:common_loading_skeleton/src/wrappers/page_wrapper.dart';
import 'package:flutter/material.dart';

import '../../models/sample_item.dart';
import '../settings_view.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  late List<SampleItem> items;
  final SampleItemService sampleItemService = SampleItemService();
  late String? pageError;

  @override
  void initState() {
    super.initState();
    pageError = null;
    items = [];
    _fetchItems();
  }

  // Fetch items and handle errors
  Future<void> _fetchItems() async {
    try {
      final fetchedItems = await sampleItemService.getItems();
      setState(() {
        items = fetchedItems;
        pageError = null;
      });
    } catch (error) {
      print(error);
      setState(() {
        pageError = "Failed to fetch items. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        onInit: () async {
          // Common logic, such as API calls
          await _fetchItems();
        },
        appBarTitle: 'Sample Items',
        loadingMessage: "Loading Items Please Wait",
        appBarActions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
        error: pageError,
        child: ListView.builder(
          shrinkWrap: true,
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            int order = index + 1;
            String iconText = order.toString();
            return ListTile(
              title: Text(item.title),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  iconText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                  arguments: item.id,
                );
              },
            );
          },
        ));
  }
}
