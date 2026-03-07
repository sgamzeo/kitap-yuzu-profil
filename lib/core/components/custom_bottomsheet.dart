import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  final VoidCallback? onPressed;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.child,

    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: TextButton(
              onPressed: Get.back,
              child: Text(
                "İptal",
                style: Theme.of(
                  context,
                ).textTheme.osP.copyWith(color: AppColors.wireframeMetin1),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.s,
                vertical: AppDimens.m,
              ),
              child: Column(
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: AppDimens.l),

                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
