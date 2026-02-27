import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/highlight_menu.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/highlight_menu.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/highlight_menu.dart';

class PdfTextTestPage extends GetView<PdfReaderController> {
  const PdfTextTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final path = args['pdfPath'];
    final isAsset = args['isAsset'] ?? false;

    Future.microtask(() {
      controller.extractPdfText(path, isAsset: isAsset);
    });

    return Scaffold(
      backgroundColor: controller.appearance.value.backgroundColor,
      appBar: AppBar(
        backgroundColor: controller.appearance.value.backgroundColor,
        elevation: 0,
        title: const Text("PDF TEXT TEST"),
      ),
      body: Obx(() {
        if (controller.isLoadingText.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pages.isEmpty) {
          return const Center(child: Text("No content"));
        }

        final pageIndex = controller.currentPage.value;
        final pageText = controller.pages[pageIndex];

        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText.rich(
                      TextSpan(children: _buildSpans(pageText, pageIndex)),
                      onSelectionChanged: (selection, cause) {
                        controller.setSelection(selection);
                      },
                    ),
                  ),
                ),

                /// 🔹 Pagination Bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: pageIndex > 0
                            ? () {
                                controller.currentPage.value--;
                                controller.currentSelection.value = null;
                              }
                            : null,
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        "${pageIndex + 1} / ${controller.pages.length}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: pageIndex < controller.pages.length - 1
                            ? () {
                                controller.currentPage.value++;
                                controller.currentSelection.value = null;
                              }
                            : null,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// 🔹 Highlight Menu
            Obx(() {
              final selection = controller.currentSelection.value;

              if (selection == null || selection.isCollapsed) {
                return const SizedBox.shrink();
              }

              return const Positioned(
                left: 0,
                right: 0,
                bottom: 60,
                child: HighlightMenu(),
              );
            }),
          ],
        );
      }),
    );
  }

  List<TextSpan> _buildSpans(String text, int pageIndex) {
    final controller = Get.find<PdfReaderController>();

    final spans = <TextSpan>[];

    final normalStyle = TextStyle(
      fontSize: 18 * controller.appearance.value.zoomLevel,
      height: 1.6,
      color: Colors.black,
    );

    int currentIndex = 0;

    /// 🔹 Only highlights for this page
    final pageHighlights =
        controller.highlights.where((h) => h.page == pageIndex).toList()
          ..sort((a, b) => a.start.compareTo(b.start));

    for (final highlight in pageHighlights) {
      if (highlight.start >= text.length) continue;

      final safeEnd = highlight.end > text.length ? text.length : highlight.end;

      if (safeEnd <= highlight.start) continue;

      if (highlight.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, highlight.start),
            style: normalStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: text.substring(highlight.start, safeEnd),
          style: normalStyle.copyWith(backgroundColor: highlight.color),
        ),
      );

      currentIndex = safeEnd;
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.substring(currentIndex), style: normalStyle),
      );
    }

    return spans;
  }
}
