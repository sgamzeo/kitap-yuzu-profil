import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/models/pdf_appearance.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/helpers/syncfusion_helper.dart';

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

  final SyncfusionPdfHelper helper;
  final box = GetStorage();

  // =============================
  // PAGINATION
  // =============================

  final pages = <String>[].obs;
  final currentPage = 0.obs;

  // =============================
  // APPEARANCE
  // =============================

  final appearance = const ReaderAppearance(
    background: ReaderBackground.white,
    customBackgroundColor: null,
    displayMode: ReaderDisplayMode.page,
    zoomLevel: 1.0,
    font: ReaderFont.serif,
    fontSize: ReaderFontSize.medium,
  ).obs;
  void changeBackground(ReaderBackground background) {
    appearance.value = appearance.value.copyWith(background: background);
  }

  void changeCustomBackground(Color color) {
    appearance.value = appearance.value.copyWith(
      background: ReaderBackground.custom,
      customBackgroundColor: color,
    );
  }

  void changeDisplayMode(ReaderDisplayMode mode) {
    appearance.value = appearance.value.copyWith(displayMode: mode);
  }

  void changeFont(ReaderFont font) {
    appearance.value = appearance.value.copyWith(font: font);
  }

  void changeFontSize(ReaderFontSize size) {
    appearance.value = appearance.value.copyWith(fontSize: size);
  }

  void setZoom(double zoom) {
    appearance.value = appearance.value.copyWith(zoomLevel: zoom);
  }

  // =============================
  // TEXT EXTRACTION
  // =============================

  final isLoadingText = false.obs;

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

  // =============================
  // SELECTION
  // =============================

  final currentSelection = Rxn<TextSelection>();

  void setSelection(TextSelection selection) {
    currentSelection.value = selection;
  }

  void clearSelection() {
    currentSelection.value = null;
  }

  // =============================
  // HIGHLIGHT
  // =============================

  final highlights = <HighlightRange>[].obs;

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

  // =============================
  // COPY & QUOTE
  // =============================

  void copySelectedText() {
    final selection = currentSelection.value;

    if (selection == null || selection.isCollapsed) return;

    final pageText = pages[currentPage.value];

    final selected = pageText.substring(selection.start, selection.end);

    Clipboard.setData(ClipboardData(text: selected));

    currentSelection.value = null;
  }

  void sendToQuotePage() {
    final selection = currentSelection.value;

    if (selection == null || selection.isCollapsed) return;

    final pageText = pages[currentPage.value];

    final selected = pageText.substring(selection.start, selection.end);

    Get.toNamed(AppRoutes.addQquotation, arguments: {'quote': selected});

    currentSelection.value = null;
  }
}
