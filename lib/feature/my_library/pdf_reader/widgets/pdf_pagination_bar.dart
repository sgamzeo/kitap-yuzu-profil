import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class PdfPaginationBar extends GetView<PdfReaderController> {
  const PdfPaginationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pages.isEmpty) {
        return const SizedBox.shrink();
      }

      final displayMode = controller.appearance.value.displayMode;
      final pageIndex = controller.currentPage.value;
      final totalPages = controller.pages.length;

      // Calculate display text based on mode
      String pageText;
      if (displayMode == ReaderDisplayMode.spread) {
        final spreadIndex = (pageIndex ~/ 2) * 2;
        final leftPage = spreadIndex + 1;
        final rightPage = (spreadIndex + 1 < totalPages)
            ? spreadIndex + 2
            : leftPage;
        pageText = leftPage == rightPage
            ? "$leftPage / $totalPages"
            : "$leftPage-$rightPage / $totalPages";
      } else {
        pageText = "${pageIndex + 1} / $totalPages";
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.m),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: controller.canGoPrevious
                  ? controller.previousPage
                  : null,
              icon: const Icon(Icons.arrow_back),
            ),
            Text(pageText),
            IconButton(
              onPressed: controller.canGoNext ? controller.nextPage : null,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      );
    });
  }
}
