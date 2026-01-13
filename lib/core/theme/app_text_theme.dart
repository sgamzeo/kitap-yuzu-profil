import 'package:flutter/material.dart';

class AppTextTheme {
  static const String _font = 'Inter';

  static const TextTheme light = TextTheme(
    displayLarge: TextStyle(
      fontFamily: _font,
      fontSize: 40, // Ag h1
      height: 1.2,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontFamily: _font,
      fontSize: 32, // Ag h2
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontFamily: _font,
      fontSize: 28, // Ag h3
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),

    headlineMedium: TextStyle(
      fontFamily: _font,
      fontSize: 23, // Ag h4
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontFamily: _font,
      fontSize: 19, // Ag h5
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: _font,
      fontSize: 16, // Ag p
      height: 1.2,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: _font,
      fontSize: 16,
      height: 1.2,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: _font,
      fontSize: 11,
      height: 1.2,
      fontWeight: FontWeight.w400,
    ),

    labelSmall: TextStyle(
      fontFamily: _font,
      fontSize: 11, // Ag small2
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
  );
}
