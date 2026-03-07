import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';

class ReaderAppearance {
  final ReaderBackground background;
  final Color? customBackgroundColor;

  final ReaderDisplayMode displayMode;
  final double zoomLevel;
  final ReaderFont font;
  final ReaderFontSize fontSize;

  const ReaderAppearance({
    required this.background,
    this.customBackgroundColor,
    required this.displayMode,
    required this.zoomLevel,
    required this.font,
    required this.fontSize,
  });

  Color get backgroundColor => background.resolve(customBackgroundColor);

  ReaderAppearance copyWith({
    ReaderBackground? background,
    Color? customBackgroundColor,
    ReaderDisplayMode? displayMode,
    double? zoomLevel,
    ReaderFont? font,
    ReaderFontSize? fontSize,
  }) {
    return ReaderAppearance(
      background: background ?? this.background,
      customBackgroundColor:
          customBackgroundColor ?? this.customBackgroundColor,
      displayMode: displayMode ?? this.displayMode,
      zoomLevel: zoomLevel ?? this.zoomLevel,
      font: font ?? this.font,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
