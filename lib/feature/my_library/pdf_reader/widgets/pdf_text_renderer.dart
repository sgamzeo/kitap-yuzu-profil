import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/services/text_span_builder.dart';

class PdfTextRenderer extends GetView<PdfReaderController> {
  final String text;
  final int pageIndex;

  const PdfTextRenderer({
    super.key,
    required this.text,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final appearance = controller.appearance.value;
      final highlights = controller.highlights;

      return SelectableText.rich(
        TextSpan(
          children: TextSpanBuilder.buildSpans(
            text: text,
            pageIndex: pageIndex,
            appearance: appearance,
            highlights: highlights,
          ),
        ),
        onSelectionChanged: (selection, cause) {
          controller.setSelection(selection);
        },
      );
    });
  }
}
