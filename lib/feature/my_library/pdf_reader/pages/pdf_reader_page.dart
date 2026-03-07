import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/models/pdf_appearance.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/highlight/highlight_menu.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/reader_appearance/appearance_bottom_sheet.dart';

class PdfReaderPage extends GetView<PdfReaderController> {
  const PdfReaderPage({super.key});

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
        appBar: _buildAppbar(bgColor, context),
        body: _buildBody(appearance),
      );
    });
  }

  AppBar _buildAppbar(Color bgColor, BuildContext context) {
    Widget icon(String asset, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: SvgPicture.asset(
              asset,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      );
    }

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,

      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon(IconConstants.cancel, () => Get.back()),
          icon(IconConstants.quotations, () {}),
        ],
      ),

      actions: [
        icon(IconConstants.search2, () {}),
        icon(IconConstants.save, () {}),
        icon(IconConstants.options, () => _openAppearanceSheet(context)),
        const SizedBox(width: 12),
      ],
    );
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
