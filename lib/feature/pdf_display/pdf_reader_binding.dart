import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/helpers/syncfusion_helper.dart';
import 'pdf_reader_controller.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfReaderController>(
      () => PdfReaderController(SyncfusionPdfHelper()),
    );
  }
}
