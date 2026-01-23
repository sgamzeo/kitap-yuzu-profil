import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.transparent,
    ),

    textTheme: GoogleFonts.interTextTheme(AppTextTheme.light),
  );
}
