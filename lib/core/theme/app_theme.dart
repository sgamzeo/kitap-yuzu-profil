import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.grey.withOpacity(0.05),

    scaffoldBackgroundColor: AppColors.backgroundColor,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.transparent,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      elevation: 4,
    ),

    textTheme: GoogleFonts.interTextTheme(AppTextTheme.light),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      unselectedLabelColor: const Color(0xFF8A8A8A),
      indicatorSize: TabBarIndicatorSize.tab,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.bottomsheetBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),

    popupMenuTheme: const PopupMenuThemeData(
      surfaceTintColor: Colors.transparent,
      color: AppColors.gray100,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}
