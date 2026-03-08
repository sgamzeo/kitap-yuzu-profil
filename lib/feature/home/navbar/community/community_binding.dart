import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/community/community_controller.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityController>(() => CommunityController());
  }
}
