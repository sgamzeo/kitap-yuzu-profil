import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SyncfusionPdfHelper {
  final PdfViewerController controller = PdfViewerController();

  Widget buildViewer({
    required String assetPath,
    required void Function(String text) onTextSelected,
  }) {
    return SfPdfViewer.asset(
      assetPath,
      controller: controller,
      onTextSelectionChanged: (details) {
        final text = details.selectedText;
        if (text != null && text.trim().isNotEmpty) {
          onTextSelected(text);
        }
      },
    );
  }

  void clearSelection() {
    controller.clearSelection();
  }
}
