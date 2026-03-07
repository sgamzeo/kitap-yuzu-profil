import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/pdf_text_renderer.dart';

class PdfContentViewer extends GetView<PdfReaderController> {
  const PdfContentViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final displayMode = controller.appearance.value.displayMode;

      switch (displayMode) {
        case ReaderDisplayMode.spread:
          return const _SpreadMode();
        case ReaderDisplayMode.page:
          return const _PageMode();
        case ReaderDisplayMode.scroll:
          return const _ScrollMode();
      }
    });
  }
}

class _SpreadMode extends GetView<PdfReaderController> {
  const _SpreadMode();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pages.isEmpty) {
        return const Center(child: Text('No pages loaded'));
      }

      // Ensure currentPage is always even (0, 2, 4, ...)
      final spreadIndex = (controller.currentPage.value ~/ 2) * 2;
      final leftPageIndex = spreadIndex;
      final rightPageIndex = spreadIndex + 1;

      return SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.pdfContentPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leftPageIndex < controller.pages.length)
              Expanded(
                child: PdfTextRenderer(
                  text: controller.pages[leftPageIndex],
                  pageIndex: leftPageIndex,
                ),
              ),
            if (rightPageIndex < controller.pages.length) ...[
              SizedBox(width: AppDimens.m),
              Expanded(
                child: PdfTextRenderer(
                  text: controller.pages[rightPageIndex],
                  pageIndex: rightPageIndex,
                ),
              ),
            ],
          ],
        ),
      );
    });
  }
}

class _PageMode extends GetView<PdfReaderController> {
  const _PageMode();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pages.isEmpty) {
        return const Center(child: Text('No pages loaded'));
      }

      final pageIndex = controller.currentPage.value;

      if (pageIndex >= controller.pages.length) {
        return const Center(child: Text('Invalid page index'));
      }

      final pageText = controller.pages[pageIndex];

      return SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.pdfContentPadding),
        child: PdfTextRenderer(text: pageText, pageIndex: pageIndex),
      );
    });
  }
}

class _ScrollMode extends GetView<PdfReaderController> {
  const _ScrollMode();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pages.isEmpty) {
        return const Center(child: Text('No pages loaded'));
      }

      return ListView.builder(
        padding: EdgeInsets.all(AppDimens.pdfContentPadding),
        itemCount: controller.pages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppDimens.pdfPageSpacing),
            child: PdfTextRenderer(
              text: controller.pages[index],
              pageIndex: index,
            ),
          );
        },
      );
    });
  }
}
