import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;

  const CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: AppColors.transparent,
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.osSmall.copyWith(color: textColor ?? AppColors.tertiary),
      ),
    );
  }
}
