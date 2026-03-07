import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

      final pageIndex = controller.currentPage.value;
      final totalPages = controller.pages.length;

      return Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.m),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: pageIndex > 0 ? controller.previousPage : null,
              icon: const Icon(Icons.arrow_back),
            ),
            Text("${pageIndex + 1} / $totalPages"),
            IconButton(
              onPressed: pageIndex < totalPages - 1
                  ? controller.nextPage
                  : null,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      );
    });
  }
}
