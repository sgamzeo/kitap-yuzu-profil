import 'package:flutter/material.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.light,
    useMaterial3: true,
  );
}
