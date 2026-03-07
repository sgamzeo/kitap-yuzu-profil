import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/reader_appearance.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/highlight_menu.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/widgets/reader_appeareance_bottom_sheet.dart';

class PdfTextTestPage extends GetView<PdfReaderController> {
  const PdfTextTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    final path = args?['pdfPath'];
    final isAsset = args?['isAsset'] ?? false;

    if (path != null) {
      Future.microtask(() {
        controller.extractPdfText(path, isAsset: isAsset);
      });
    }

    Future.microtask(() {
      controller.extractPdfText(path, isAsset: isAsset);
    });

    return Obx(() {
      final appearance = controller.appearance.value;
      final bgColor = appearance.backgroundColor;

      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: const Text("PDF TEXT TEST"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.tune,
                color: bgColor == Colors.black ? Colors.white : Colors.black,
              ),
              onPressed: () => _openAppearanceSheet(context),
            ),
          ],
        ),
        body: _buildBody(appearance),
      );
    });
  }

  Widget _buildBody(ReaderAppearance appearance) {
    return Obx(() {
      if (controller.isLoadingText.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final pageIndex = controller.currentPage.value;
      final pageText = controller.pages[pageIndex];

      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: appearance.displayMode == ReaderDisplayMode.page
                    ? _buildPageMode(pageText, pageIndex, appearance)
                    : _buildContinuousMode(appearance),
              ),
              _buildPaginationBar(pageIndex),
            ],
          ),

          /// Highlight Menu
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
    });
  }

  Widget _buildPageMode(
    String text,
    int pageIndex,
    ReaderAppearance appearance,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: SelectableText.rich(
        TextSpan(children: _buildSpans(text, pageIndex, appearance)),
        onSelectionChanged: (selection, cause) {
          controller.setSelection(selection);
        },
      ),
    );
  }

  Widget _buildContinuousMode(ReaderAppearance appearance) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: controller.pages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SelectableText.rich(
            TextSpan(
              children: _buildSpans(controller.pages[index], index, appearance),
            ),
            onSelectionChanged: (selection, cause) {
              controller.setSelection(selection);
            },
          ),
        );
      },
    );
  }

  Widget _buildPaginationBar(int pageIndex) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: pageIndex > 0
                ? () => controller.currentPage.value--
                : null,
            icon: const Icon(Icons.arrow_back),
          ),
          Text("${pageIndex + 1} / ${controller.pages.length}"),
          IconButton(
            onPressed: pageIndex < controller.pages.length - 1
                ? () => controller.currentPage.value++
                : null,
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildSpans(
    String text,
    int pageIndex,
    ReaderAppearance appearance,
  ) {
    final normalStyle = TextStyle(
      fontSize: appearance.fontSize.value,
      height: 1.6,
      color: appearance.backgroundColor.computeLuminance() < 0.5
          ? Colors.white
          : Colors.black,
      fontFamily: appearance.font.fontFamily,
    );

    final spans = <TextSpan>[];
    int currentIndex = 0;

    final pageHighlights =
        controller.highlights.where((h) => h.page == pageIndex).toList()
          ..sort((a, b) => a.start.compareTo(b.start));

    for (final highlight in pageHighlights) {
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
          text: text.substring(highlight.start, highlight.end),
          style: normalStyle.copyWith(backgroundColor: highlight.color),
        ),
      );

      currentIndex = highlight.end;
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.substring(currentIndex), style: normalStyle),
      );
    }

    return spans;
  }

  void _openAppearanceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ReaderAppearanceBottomSheet(),
    );
  }
}
