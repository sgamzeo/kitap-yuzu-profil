import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        elevation: WidgetStatePropertyAll(0),
      ),
      child: Text(text, style: TextStyle(color: AppColors.backgroundColor)),
    );
  }
}
