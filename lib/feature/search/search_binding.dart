import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/search/search_controller.dart'
    as search;

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<search.SearchPageController>(
      () => search.SearchPageController(),
    );
  }
}
