import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    textTheme: GoogleFonts.interTextTheme(AppTextTheme.light),
  );
}
