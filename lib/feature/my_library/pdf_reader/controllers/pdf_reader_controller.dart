import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/extensions/list_extensions.dart';
import 'package:kitap_yuzu_profil/core/extensions/text_selection_extensions.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/models/pdf_appearance.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/reader_appearance/appearance_bottom_sheet.dart';
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

  bool get hasPages => pages.isNotEmpty;
  bool get hasMultiplePages => pages.length > 1;
  bool get canGoNext => hasPages && currentPage.value < pages.length - 1;
  bool get canGoPrevious => hasPages && currentPage.value > 0;

  void nextPage() {
    if (canGoNext) {
      final displayMode = appearance.value.displayMode;
      // In spread mode, jump by 2 pages
      if (displayMode == ReaderDisplayMode.spread) {
        currentPage.value = (currentPage.value + 2).clamp(0, pages.length - 1);
      } else {
        currentPage.value++;
      }
    }
  }

  void previousPage() {
    if (canGoPrevious) {
      final displayMode = appearance.value.displayMode;
      // In spread mode, jump by 2 pages
      if (displayMode == ReaderDisplayMode.spread) {
        currentPage.value = (currentPage.value - 2).clamp(0, pages.length - 1);
      } else {
        currentPage.value--;
      }
    }
  }

  void goToPage(int index) {
    if (pages.isValidIndex(index)) {
      currentPage.value = index;
    }
  }

  String? get currentPageText => pages.getOrNull(currentPage.value);

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

      if (result.isNotEmpty) {
        pages.assignAll(result);
        currentPage.value = 0;
      } else {
        pages.assignAll(["No content found in PDF"]);
        currentPage.value = 0;
      }
    } catch (e) {
      pages.assignAll(["PDF parse error: $e"]);
      currentPage.value = 0;
    } finally {
      isLoadingText.value = false;
    }
  }

  // =============================
  // SELECTION
  // =============================

  final currentSelection = Rxn<TextSelection>();
  final selectionPosition = Rxn<Offset>();

  bool get hasSelection => currentSelection.value?.isValid ?? false;

  void setSelection(TextSelection selection, {Offset? position}) {
    currentSelection.value = selection;
    if (position != null) {
      selectionPosition.value = position;
    }
  }

  void clearSelection() {
    currentSelection.value = null;
    selectionPosition.value = null;
  }

  String? get selectedText {
    final selection = currentSelection.value;
    final pageText = currentPageText;

    if (selection == null || !selection.isValid || pageText == null) {
      return null;
    }

    return selection.getTextFrom(pageText);
  }

  // =============================
  // HIGHLIGHT
  // =============================

  final highlights = <HighlightRange>[].obs;
  final lastUsedHighlightColor = const Color(0xFFFFB6C1).obs; // Default: Pink

  void addHighlight(Color color) {
    final selection = currentSelection.value;

    if (!hasSelection) return;

    final page = currentPage.value;
    final start = selection!.start;
    final end = selection.end;

    // Remove any existing highlights that overlap with this selection
    highlights.removeWhere(
      (h) =>
          h.page == page &&
          ((h.start >= start && h.start < end) || // h starts within selection
              (h.end > start && h.end <= end) || // h ends within selection
              (h.start <= start && h.end >= end)),
    ); // h contains selection

    // Add the new highlight
    highlights.add(
      HighlightRange(page: page, start: start, end: end, color: color),
    );

    // Update last used color
    lastUsedHighlightColor.value = color;

    highlights.refresh();
    clearSelection();
  }

  // =============================
  // COPY & QUOTE
  // =============================

  void copySelectedText() {
    final text = selectedText;
    if (text == null) return;

    Clipboard.setData(ClipboardData(text: text));
    clearSelection();
  }

  void sendToQuotePage() {
    final text = selectedText;
    if (text == null) return;

    Get.toNamed(AppRoutes.addQquotation, arguments: {'quote': text});
    clearSelection();
  }

  // =============================
  // UI ACTIONS
  // =============================

  @override
  void onClose() {
    super.onClose();
    Get.back();
  }

  void onOpenQuotations() {
    // TODO: Implement quotations list
  }

  void onSearch() {
    // TODO: Implement search functionality
  }

  void onSave() {
    // TODO: Implement save functionality
  }

  void onOpenAppearance(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ReaderAppearanceBottomSheet(),
    );
  }

  // =============================
  // INITIALIZATION
  // =============================

  bool _isInitialized = false;

  void initializePdf() {
    if (_isInitialized) return;

    final args = Get.arguments as Map<String, dynamic>?;
    final path = args?['pdfPath'];
    final isAsset = args?['isAsset'] ?? false;

    if (path != null) {
      _isInitialized = true;
      extractPdfText(path, isAsset: isAsset);
    }
  }
}
