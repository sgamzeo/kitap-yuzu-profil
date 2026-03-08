import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/feed/feed_controller.dart';

class FeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() => FeedController());
  }
}
