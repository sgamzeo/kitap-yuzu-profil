import 'package:flutter/material.dart';

extension AppTextStyles on TextTheme {
  // Figma: Ag p italic / Auto
  TextStyle get bodyItalic => bodyLarge!.copyWith(fontStyle: FontStyle.italic);

  // Figma: Ag small2 / Auto
  TextStyle get small2 => bodySmall!.copyWith(fontSize: 11);
}
