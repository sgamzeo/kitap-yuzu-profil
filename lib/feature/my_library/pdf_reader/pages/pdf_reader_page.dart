import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/pdf_reader_appbar.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/pdf_reader_body.dart';

class PdfReaderPage extends GetView<PdfReaderController> {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initializePdf();

    return Obx(() {
      final bgColor = controller.appearance.value.backgroundColor;
      final isUIVisible = controller.isUIVisible.value;

      return Scaffold(
        backgroundColor: bgColor,
        appBar: isUIVisible ? PdfReaderAppBar(backgroundColor: bgColor) : null,
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              controller.toggleUIVisibility();
              controller.clearSelection();
            },
            child: const PdfReaderBody(),
          ),
        ),
      );
    });
  }
}
