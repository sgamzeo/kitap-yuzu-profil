import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/extensions/color_extensions.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

enum ReaderBackground { white, gray, sepia, custom }

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

      case ReaderBackground.gray:
        return AppColors.wireframe4;

      case ReaderBackground.sepia:
        return AppColors.foundation;

      case ReaderBackground.custom:
        return customColor ?? Colors.white;
    }
  }

  Color textColor(Color? customColor) {
    return resolve(customColor).contrastingTextColor;
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
