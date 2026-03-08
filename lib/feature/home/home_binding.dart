import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/home_controller.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/community/community_binding.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/feed/feed_binding.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/messages/messages_binding.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/recents/recents_binding.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_binding.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());

    // Initialize all navbar bindings
    FeedBinding().dependencies();
    RecentsBinding().dependencies();
    MyLibraryBinding().dependencies();
    CommunityBinding().dependencies();
    MessagesBinding().dependencies();
  }
}
