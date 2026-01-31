import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/add_quotation_view.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/my_library_view.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader.page.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_binding.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_selector_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const PdfSelectorPage()),

    GetPage(
      name: AppRoutes.reader,
      page: () => const PdfReaderPage(),
      binding: PdfReaderBinding(),
    ),
    GetPage(name: AppRoutes.addQquotation, page: () => AddQuotationView()),
    GetPage(name: AppRoutes.myLibrary, page: () => MyLibraryView()),
  ];
}
