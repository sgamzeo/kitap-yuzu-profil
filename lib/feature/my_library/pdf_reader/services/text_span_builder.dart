import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/extensions/color_extensions.dart';
import 'package:kitap_yuzu_profil/core/extensions/string_extensions.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/models/pdf_appearance.dart';

class TextSpanBuilder {
  static List<TextSpan> buildSpans({
    required String text,
    required int pageIndex,
    required ReaderAppearance appearance,
    required List<HighlightRange> highlights,
  }) {
    final normalStyle = _buildTextStyle(appearance);
    final spans = <TextSpan>[];
    int currentIndex = 0;

    final pageHighlights = highlights.where((h) => h.page == pageIndex).toList()
      ..sort((a, b) => a.start.compareTo(b.start));

    for (final highlight in pageHighlights) {
      if (highlight.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.safeSubstring(currentIndex, highlight.start),
            style: normalStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: text.safeSubstring(highlight.start, highlight.end),
          style: normalStyle.copyWith(backgroundColor: highlight.color),
        ),
      );

      currentIndex = highlight.end;
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.safeSubstring(currentIndex), style: normalStyle),
      );
    }

    return spans;
  }

  static TextStyle _buildTextStyle(ReaderAppearance appearance) {
    return TextStyle(
      fontSize: appearance.fontSize.value,
      height: 1.6,
      color: appearance.backgroundColor.contrastingTextColor,
      fontFamily: appearance.font.fontFamily,
    );
  }
}
