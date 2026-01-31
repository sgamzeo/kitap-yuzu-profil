import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/highlight_menu.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/reader_appeareance_bottom_sheet.dart';
import 'pdf_reader_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderPage extends StatelessWidget {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PdfReaderController c = Get.find<PdfReaderController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: () => _openReaderAppearanceSheet(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(
            () => SfPdfViewerTheme(
              data: SfPdfViewerThemeData(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SfPdfViewer.asset(
                'assets/pdfs/426122.pdf',
                controller: c.helper.controller,

                onDocumentLoaded: (_) {
                  c.setOpenedPdf('assets/pdfs/426122.pdf');
                  c.restoreLastPosition();
                },

                onPageChanged: c.onPageChanged,
                onZoomLevelChanged: c.onZoomChanged,

                onTextSelectionChanged: (details) {
                  final text = details.selectedText;
                  if (text == null || text.trim().isEmpty) {
                    c.clearSelection();
                    return;
                  }
                  c.onTextSelected(text);
                },

                scrollDirection:
                    c.appearance.value.scrollMode == ReaderScrollMode.horizontal
                    ? PdfScrollDirection.horizontal
                    : PdfScrollDirection.vertical,
              ),
            ),
          ),

          Obx(() {
            if (!c.hasSelection.value) return const SizedBox.shrink();

            return Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: HighlightMenu(),
            );
          }),
        ],
      ),
    );
  }

  void _openReaderAppearanceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ReaderAppearanceBottomSheet(),
    );
  }
}
