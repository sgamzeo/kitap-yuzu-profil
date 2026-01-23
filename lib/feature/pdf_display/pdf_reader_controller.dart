import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/routes/app_pages.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/quation_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class PdfReaderController extends GetxController {
  final PdfViewerController pdfController = PdfViewerController();

  String? selectedText;
  final hasSelection = false.obs;

  final Rx<Color> highlightColor = Colors.blue.obs;

  final currentPage = 1.obs;
  final zoomLevel = 1.0.obs;

  void changeColor(Color color) {
    highlightColor.value = color;
    pdfController.clearSelection();
  }

  void onTextSelectionChanged(PdfTextSelectionChangedDetails details) {
    final text = details.selectedText;
    if (text == null || text.trim().isEmpty) {
      _clearState();
      return;
    }
    selectedText = text;
    hasSelection.value = true;
  }

  void onPageChanged(PdfPageChangedDetails details) {
    currentPage.value = details.newPageNumber;
  }

  void onZoomChanged(PdfZoomDetails details) {
    zoomLevel.value = details.newZoomLevel;
  }

  void copySelectedText() {
    if (selectedText == null) return;
    Clipboard.setData(ClipboardData(text: selectedText!));
    clearSelection();
  }

  void sendToQuotePage() {
    if (selectedText == null) return;

    final args = {'text': selectedText, 'color': highlightColor.value};

    pdfController.clearSelection();
    _clearState();

    Get.toNamed(AppRoutes.addQquotation, arguments: args);
  }

  void clearSelection() {
    pdfController.clearSelection();
    _clearState();
  }

  void _clearState() {
    selectedText = null;
    hasSelection.value = false;
  }
}

class QuoteController extends GetxController {
  final quotes = <Quote>[].obs;

  void addQuote({
    required String text,
    required Color color,
    required String source,
  }) {
    final quote = Quote(
      id: const Uuid().v4(),
      text: text,
      color: color,
      createdAt: DateTime.now(),
      source: source,
    );

    quotes.add(quote);
  }
}
