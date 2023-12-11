import 'package:common_loading_skeleton/src/models/sample_item.dart';
import 'package:common_loading_skeleton/src/services/sample_item_service.dart';
import 'package:common_loading_skeleton/src/wrappers/page_wrapper.dart';
import 'package:flutter/material.dart';

class SampleItemDetailsView extends StatefulWidget {
  static const routeName = '/details';

  const SampleItemDetailsView({super.key});

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  late SampleItem? itemDetail;
  final SampleItemService sampleItemService = SampleItemService();
  late String? pageError;

  @override
  void initState() {
    super.initState();
    pageError = null;
    itemDetail = null;
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    try {
      final int id = ModalRoute.of(context)?.settings.arguments as int;

      final item = await sampleItemService.getItemDetail(id);
      setState(() {
        itemDetail = item;
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
    // Retrieve the description passed through route arguments

    return  PageWrapper(
        onInit: () async {
          // Your common logic, such as API calls
          await _fetchItems();
        },
        appBarTitle: 'Item Detail ',
        loadingMessage: "Loading Item Detail Please Wait",
        error: pageError,
        child: itemDetail != null ? Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemDetail!.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8,),
            Text(itemDetail!.description)
          ],
        ) : const SizedBox(),
    );
  }
}
