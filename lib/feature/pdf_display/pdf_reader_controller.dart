import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../core/routes/app_routes.dart';
import '../../core/helpers/syncfusion_helper.dart';

class HighlightRange {
  final int page;
  final int start;
  final int end;
  final Color color;

  HighlightRange({
    required this.page,
    required this.start,
    required this.end,
    required this.color,
  });
}

class PdfReaderController extends GetxController {
  PdfReaderController(this.helper);
  final pages = <String>[].obs;
  final currentPage = 0.obs;
  final SyncfusionPdfHelper helper;
  final box = GetStorage();

  // =============================
  // COMMON STATE
  // =============================

  String? openedPdfPath;

  String get bookTitle {
    if (openedPdfPath == null) return '';
    return openedPdfPath!.split('/').last.replaceAll('.pdf', '');
  }

  // =============================
  // APPEARANCE
  // =============================

  final appearance = const ReaderAppearance(
    backgroundColor: Colors.white,
    scrollMode: ReaderScrollMode.vertical,
    zoomLevel: 1.0,
  ).obs;

  void changeBackground(Color color) {
    appearance.value = appearance.value.copyWith(backgroundColor: color);
  }

  void changeScrollMode(ReaderScrollMode mode) {
    appearance.value = appearance.value.copyWith(scrollMode: mode);
  }

  void setZoom(double zoom) {
    appearance.value = appearance.value.copyWith(zoomLevel: zoom);

    helper.controller?.zoomLevel = zoom;
  }

  void saveAppearance() {}

  // =============================
  // PDF VIEW MODE
  // =============================

  void setOpenedPdf(String path) {
    if (openedPdfPath == path) return;
    openedPdfPath = path;
    helper.initController();
  }

  void onPageChanged(PdfPageChangedDetails details) {
    if (openedPdfPath == null) return;
    box.write('last_page_$openedPdfPath', details.newPageNumber);
  }

  void onZoomChanged(PdfZoomDetails details) {
    if (openedPdfPath == null) return;
    box.write('last_zoom_$openedPdfPath', details.newZoomLevel);
  }

  void restoreLastPosition() {
    if (openedPdfPath == null || helper.controller == null) return;

    final page = box.read<int>('last_page_$openedPdfPath');
    final zoom = box.read<double>('last_zoom_$openedPdfPath');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (page != null) {
        helper.controller!.jumpToPage(page);
      }
      if (zoom != null) {
        helper.controller!.zoomLevel = zoom;
        appearance.value = appearance.value.copyWith(zoomLevel: zoom);
      }
    });
  }

  // =============================
  // TEXT MODE
  // =============================

  final extractedText = ''.obs;
  final isLoadingText = false.obs;

  final selectedText = ''.obs;
  final hasSelection = false.obs;

  Future<void> extractPdfText(String path, {bool isAsset = false}) async {
    try {
      isLoadingText.value = true;

      List<String> result;

      if (isAsset) {
        final byteData = await rootBundle.load(path);
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/temp.pdf');
        await file.writeAsBytes(byteData.buffer.asUint8List());

        result = await ReadPdfText.getPDFtextPaginated(file.path);
      } else {
        result = await ReadPdfText.getPDFtextPaginated(path);
      }

      pages.assignAll(result);
      currentPage.value = 0;
    } catch (e) {
      pages.assignAll(["PDF parse error: $e"]);
    } finally {
      isLoadingText.value = false;
    }
  }

  void onTextSelected(String value) {
    selectedText.value = value;
    hasSelection.value = value.trim().isNotEmpty;
  }

  void clearSelection() {
    selectedText.value = '';
    hasSelection.value = false;
  }

  void copySelectedText() {
    if (selectedText.value.isEmpty) return;
    Clipboard.setData(ClipboardData(text: selectedText.value));
    clearSelection();
  }

  void sendToQuotePage() {
    final selection = currentSelection.value;
    if (selection == null || selection.isCollapsed) return;

    final pageIndex = currentPage.value;
    final pageText = pages[pageIndex];

    if (selection.end > pageText.length) return;

    final selected = pageText.substring(selection.start, selection.end);

    Get.toNamed(
      AppRoutes.addQquotation,
      arguments: {'quote': selected, 'bookTitle': bookTitle},
    );

    currentSelection.value = null;
  }

  final highlights = <HighlightRange>[].obs;
  final currentSelection = Rxn<TextSelection>();

  void setSelection(TextSelection selection) {
    currentSelection.value = selection;
  }

  void addHighlight(Color color) {
    final selection = currentSelection.value;
    if (selection == null || selection.isCollapsed) return;

    highlights.add(
      HighlightRange(
        page: currentPage.value,
        start: selection.start,
        end: selection.end,
        color: color,
      ),
    );

    highlights.refresh();
    currentSelection.value = null;
  }
}
