import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? color;
  final double? radius;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.textColor,
    this.textStyle,
    this.color,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 326,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            BorderSide(color: AppColors.primary, width: 1),
          ),

          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 51, vertical: 10),
          ),

          backgroundColor: WidgetStateProperty.all(
            color ?? AppColors.primary,
          ), //
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 15),
            ),
          ),
        ),

        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(color: textColor ?? AppColors.backgroundColor),
        ),
      ),
    );
  }
}
