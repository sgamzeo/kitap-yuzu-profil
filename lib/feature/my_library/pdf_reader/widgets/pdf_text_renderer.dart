import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/services/text_span_builder.dart';

class PdfTextRenderer extends GetView<PdfReaderController> {
  final String text;
  final int pageIndex;

  PdfTextRenderer({super.key, required this.text, required this.pageIndex});

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
        contextMenuBuilder: (context, editableTextState) {
          // Capture selection position from editableTextState
          _captureSelectionFromState(editableTextState);
          return const SizedBox.shrink();
        },
        onSelectionChanged: (selection, cause) {
          if (selection.isCollapsed) {
            controller.clearSelection();
          } else {
            controller.setSelection(selection);
          }
        },
      );
    });
  }

  void _captureSelectionFromState(EditableTextState editableTextState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final selection = editableTextState.textEditingValue.selection;
        if (selection.isCollapsed) return;

        final renderEditable = editableTextState.renderEditable;
        final selectionRects = renderEditable.getBoxesForSelection(selection);

        if (selectionRects.isNotEmpty) {
          final firstBox = selectionRects.first;
          final localPosition = Offset(firstBox.left, firstBox.top);
          final globalPosition = renderEditable.localToGlobal(localPosition);
          controller.setSelection(selection, position: globalPosition);
        }
      } catch (e) {
        // Silently fail
      }
    });
  }
}
