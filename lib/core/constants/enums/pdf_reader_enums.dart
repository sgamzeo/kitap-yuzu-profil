import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';

enum ReaderBackground { white, paper, sepia, dark, custom }

enum ReaderFont { serif, roboto, courier }

enum ReaderFontSize { small, medium, large, xlarge, xxlarge }

enum ReaderDisplayMode {
  spread, // iki sayfa yanyana
  page, // tek sayfa
  scroll, // endless scroll
}

extension ReaderBackgroundExtension on ReaderBackground {
  Color resolve(Color? customColor) {
    switch (this) {
      case ReaderBackground.white:
        return Colors.white;

      case ReaderBackground.paper:
        return const Color(0xFFF4F1EC);

      case ReaderBackground.sepia:
        return const Color(0xFFEDE7D9);

      case ReaderBackground.dark:
        return Colors.black;

      case ReaderBackground.custom:
        return customColor ?? Colors.white;
    }
  }

  Color textColor(Color? customColor) {
    final bg = resolve(customColor);

    return bg.computeLuminance() < 0.5 ? Colors.white : Colors.black;
  }
}

extension ReaderFontExtension on ReaderFont {
  String get label {
    switch (this) {
      case ReaderFont.serif:
        return "Serif";
      case ReaderFont.roboto:
        return "Roboto";
      case ReaderFont.courier:
        return "Courier";
    }
  }

  String get fontFamily {
    switch (this) {
      case ReaderFont.serif:
        return "Serif";
      case ReaderFont.roboto:
        return "Roboto";
      case ReaderFont.courier:
        return "Courier";
    }
  }
}

extension ReaderFontSizeExt on ReaderFontSize {
  double get value {
    switch (this) {
      case ReaderFontSize.small:
        return 16;
      case ReaderFontSize.medium:
        return 18;
      case ReaderFontSize.large:
        return 20;
      case ReaderFontSize.xlarge:
        return 22;
      case ReaderFontSize.xxlarge:
        return 24;
    }
  }
}

extension ReaderDisplayModeExt on ReaderDisplayMode {
  String get iconPath {
    switch (this) {
      case ReaderDisplayMode.spread:
        return IconConstants.readerModeSpread;
      case ReaderDisplayMode.page:
        return IconConstants.readerModePage;
      case ReaderDisplayMode.scroll:
        return IconConstants.readerModeScroll;
    }
  }
}
