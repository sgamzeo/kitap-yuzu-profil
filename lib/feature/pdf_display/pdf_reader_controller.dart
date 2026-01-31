import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';

class PdfReaderController extends GetxController {
  final PdfViewerController pdfController = PdfViewerController();

  final hasSelection = false.obs;
  final Rx<Color> highlightColor = Colors.blue.obs;
  String? selectedText;

  final appearance = ReaderAppearance(
    backgroundColor: Colors.white,
    zoomLevel: 1.0,
    scrollMode: ReaderScrollMode.vertical,
  ).obs;

  void onTextSelectionChanged(PdfTextSelectionChangedDetails details) {
    if (details.selectedText == null || details.selectedText!.trim().isEmpty) {
      clearSelection();
      return;
    }

    selectedText = details.selectedText;
    hasSelection.value = true;
  }

  void changeColor(Color color) {
    highlightColor.value = color;
    pdfController.clearSelection();
  }

  void copySelectedText() {
    if (selectedText == null) return;
    Clipboard.setData(ClipboardData(text: selectedText!));
    clearSelection();
  }

  void sendToQuotePage() {
    if (selectedText == null) return;

    Get.toNamed(
      AppRoutes.addQquotation,
      arguments: {'text': selectedText, 'color': highlightColor.value},
    );

    clearSelection();
  }

  void clearSelection() {
    pdfController.clearSelection();
    hasSelection.value = false;
    selectedText = null;
  }

  void changeBackground(Color color) {
    appearance.value = appearance.value.copyWith(backgroundColor: color);
  }

  void changeScrollMode(ReaderScrollMode mode) {
    appearance.value = appearance.value.copyWith(scrollMode: mode);
  }

  void setZoom(double zoom) {
    appearance.value = appearance.value.copyWith(zoomLevel: zoom);

    pdfController.zoomLevel = zoom;
  }

  void saveAppearance() {}
}
