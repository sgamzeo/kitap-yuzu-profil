import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/recents/recents_controller.dart';

class RecentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentsController>(() => RecentsController());
  }
}
