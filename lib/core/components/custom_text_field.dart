import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final TextStyle? labelStyle;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.labelStyle,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style:
              labelStyle ??
              Theme.of(
                context,
              ).textTheme.osSmall.copyWith(color: AppColors.black),
        ),
        SizedBox(height: AppDimens.s),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            labelStyle: Theme.of(
              context,
            ).textTheme.osSmall.copyWith(color: AppColors.hintText),
            filled: true,
            fillColor: AppColors.gray100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
