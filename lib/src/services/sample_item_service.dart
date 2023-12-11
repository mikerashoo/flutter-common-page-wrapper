// sample_item_service.dart

import 'dart:convert';
import 'package:common_loading_skeleton/src/models/sample_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class SampleItemService {
  // Fetch items from a JSON file
  Future<List<SampleItem>> getItemsFromJson() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/sample_items.json');
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert JSON to List<SampleItem>
      final List<SampleItem> items = jsonList.map((json) => SampleItem.fromJson(json)).toList();

      return items;
    } catch (error) {
      // Log errors only in debug mode
      if (kDebugMode) {
        print(error);
      }
      throw Exception(error);
    }
  }

  // Fetch items using getItemsFromJson method
  Future<List<SampleItem>> getItems() async {
    try {
      final List<SampleItem> items = await getItemsFromJson();
      return items;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Exception(error);
    }
  }

  // Fetch item details by ID
  Future<SampleItem> getItemDetail(int id) async {
    try {
      final List<SampleItem> items = await getItemsFromJson();
      SampleItem item = items.firstWhere((element) => element.id == id);

      return item;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Exception(error);
    }
  }
}
