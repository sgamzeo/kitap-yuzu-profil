import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/helpers/syncfusion_helper.dart';
import 'package:kitap_yuzu_profil/feature/my_library/library_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';

class MyLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryController>(() => LibraryController());
    Get.lazyPut<PdfReaderController>(
      () => PdfReaderController(SyncfusionPdfHelper()),
    );
  }
}
