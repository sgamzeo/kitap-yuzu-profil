import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Returns true if the color is dark (luminance < 0.5)
  bool get isDark => computeLuminance() < 0.5;

  /// Returns true if the color is light (luminance >= 0.5)
  bool get isLight => !isDark;

  /// Returns white for dark colors, black for light colors
  Color get contrastingTextColor => isDark ? Colors.white : Colors.black;

  /// Returns a color with adjusted opacity
  Color withOpacityValue(double opacity) => withOpacity(opacity);
}
