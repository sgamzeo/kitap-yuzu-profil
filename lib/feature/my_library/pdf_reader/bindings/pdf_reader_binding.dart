import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/helpers/syncfusion_helper.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfReaderController>(
      () => PdfReaderController(SyncfusionPdfHelper()),
      fenix: true,
    );
  }
}
