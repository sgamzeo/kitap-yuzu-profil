import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/messages/messages_controller.dart';

class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(() => MessagesController());
  }
}
