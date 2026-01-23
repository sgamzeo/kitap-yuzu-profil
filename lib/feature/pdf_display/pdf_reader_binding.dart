import 'package:get/get.dart';
import 'pdf_reader_controller.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfReaderController>(() => PdfReaderController());
  }
}

class QuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuoteController());
  }
}
