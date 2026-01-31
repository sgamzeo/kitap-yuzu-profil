import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/reader_appeareance_bottom_sheet.dart';
import 'pdf_reader_controller.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/reader_appeareance_bottom_sheet.dart';
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
            () => Container(
              color: c.appearance.value.backgroundColor,
              child: SfPdfViewer.asset(
                'assets/pdfs/426122.pdf',
                controller: c.pdfController,
                onTextSelectionChanged: c.onTextSelectionChanged,
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
              child: _HighlightMenu(c),
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

class _HighlightMenu extends StatelessWidget {
  final PdfReaderController c;
  const _HighlightMenu(this.c);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.black.withOpacity(0.85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _dot(Colors.yellow),
          _dot(Colors.green),
          _dot(Colors.pink),
          IconButton(
            icon: const Icon(Icons.format_quote, color: Colors.white),
            onPressed: c.sendToQuotePage,
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: c.copySelectedText,
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: c.clearSelection,
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return GestureDetector(
      onTap: () => c.changeColor(color),
      child: CircleAvatar(radius: 10, backgroundColor: color),
    );
  }
}
