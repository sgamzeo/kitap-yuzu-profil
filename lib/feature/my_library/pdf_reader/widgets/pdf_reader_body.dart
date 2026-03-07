import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/highlight/highlight_menu.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/pdf_content_viewer.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/pdf_pagination_bar.dart';

class PdfReaderBody extends GetView<PdfReaderController> {
  const PdfReaderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingText.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Stack(
        children: [
          Column(
            children: [
              const Expanded(child: PdfContentViewer()),
              const PdfPaginationBar(),
            ],
          ),
          _buildHighlightMenu(),
        ],
      );
    });
  }

  Widget _buildHighlightMenu() {
    return Obx(() {
      final selection = controller.currentSelection.value;
      if (selection == null || selection.isCollapsed) {
        return const SizedBox.shrink();
      }
      return const Positioned(
        left: 0,
        right: 0,
        bottom: 60,
        child: HighlightMenu(),
      );
    });
  }
}
