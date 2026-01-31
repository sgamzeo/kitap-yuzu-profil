import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kitap_yuzu_profil/core/constants/app_storage_keys.dart';
import 'package:kitap_yuzu_profil/core/helpers/syncfusion_helper.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../core/routes/app_routes.dart';

import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';

class PdfReaderController extends GetxController {
  final SyncfusionPdfHelper helper;
  PdfReaderController(this.helper);

  final box = GetStorage();

  String? openedPdfPath;
  String? selectedText;

  final hasSelection = false.obs;

  final appearance = const ReaderAppearance(
    backgroundColor: Colors.white,
    scrollMode: ReaderScrollMode.vertical,
    zoomLevel: 1.0,
  ).obs;

  String get bookTitle {
    if (openedPdfPath == null) return '';
    return openedPdfPath!.split('/').last.replaceAll('.pdf', '');
  }

  // =============================
  // PDF STATE
  // =============================

  void setOpenedPdf(String path) {
    if (openedPdfPath == path) return;

    openedPdfPath = path;

    // 🔑 EN KRİTİK SATIR
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
  // TEXT SELECTION
  // =============================

  void onTextSelected(String text) {
    selectedText = text;
    hasSelection.value = true;
  }

  void clearSelection() {
    helper.clearSelection();
    hasSelection.value = false;
    selectedText = null;
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
      arguments: {'quote': selectedText!, 'bookTitle': bookTitle},
    );

    clearSelection();
  }

  // =============================
  // APPEARANCE
  // =============================

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
}
