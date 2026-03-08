import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/services/text_span_builder.dart';

class PdfTextRenderer extends StatefulWidget {
  final String text;
  final int pageIndex;

  const PdfTextRenderer({
    super.key,
    required this.text,
    required this.pageIndex,
  });

  @override
  State<PdfTextRenderer> createState() => _PdfTextRendererState();
}

class _PdfTextRendererState extends State<PdfTextRenderer> {
  final FocusNode _focusNode = FocusNode();
  PdfReaderController get controller => Get.find<PdfReaderController>();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final appearance = controller.appearance.value;
      final highlights = controller.highlights;
      final selectionColor = controller.lastUsedHighlightColor.value;

      // Clear selection when controller state changes
      if (controller.currentSelection.value == null) {
        _focusNode.unfocus();
      }

      return SelectableText.rich(
        TextSpan(
          children: TextSpanBuilder.buildSpans(
            text: widget.text,
            pageIndex: widget.pageIndex,
            appearance: appearance,
            highlights: highlights,
          ),
        ),
        focusNode: _focusNode,
        selectionColor: selectionColor,
        contextMenuBuilder: (context, editableTextState) {
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
