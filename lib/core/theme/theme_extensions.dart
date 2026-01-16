import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

extension AppTextStyles on TextTheme {
  // Figma: Ag p italic / Auto
  TextStyle get bodyItalic => bodyLarge!.copyWith(fontStyle: FontStyle.italic);

  // Figma: Ag small2 / Auto
  TextStyle get small2 => bodySmall!.copyWith(fontSize: 11);
}
