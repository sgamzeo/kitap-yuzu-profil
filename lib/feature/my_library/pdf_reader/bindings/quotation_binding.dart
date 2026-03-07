import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/quotation_controller.dart';

class QuotationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotationController>(() => QuotationController());
  }
}
