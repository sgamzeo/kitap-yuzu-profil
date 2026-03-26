import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final searchTextController = TextEditingController();
  final selectedFilterIndex = 0.obs;
  final recentSearches = <String>['Kitap İsmi', 'Kitap İsmi2'].obs;

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  void onSearchChanged(String value) {
    // TODO: Implement search logic
  }

  void onRecentSearchTap(String searchText) {
    searchTextController.text = searchText;
    // TODO: Perform search
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}
