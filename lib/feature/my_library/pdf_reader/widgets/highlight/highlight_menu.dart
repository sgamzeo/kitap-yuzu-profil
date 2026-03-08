import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class HighlightMenu extends GetView<PdfReaderController> {
  const HighlightMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.m),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.m,
        vertical: AppDimens.s,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _HighlightColorButton(
            color: AppColors.foundation2,
            onTap: () => controller.addHighlight(AppColors.foundation2),
          ),
          _HighlightColorButton(
            color: AppColors.foundationAccent3,
            onTap: () => controller.addHighlight(AppColors.foundationAccent3),
          ),
          _HighlightColorButton(
            color: AppColors.foundationPremium4,
            onTap: () => controller.addHighlight(AppColors.foundationPremium4),
          ),
          _HighlightColorButton(
            color: AppColors.foundation,
            onTap: () => controller.addHighlight(AppColors.foundation),
          ),
          _MenuIconButton(
            icon: Icons.image_outlined,
            onTap: () {
              // TODO: Implement image capture
            },
          ),
          _MenuIconButton(
            icon: Icons.translate,
            onTap: () {
              // TODO: Implement translate
            },
          ),
          _MenuIconButton(
            icon: Icons.volume_up_outlined,
            onTap: () {
              // TODO: Implement text-to-speech
            },
          ),
          _MenuIconButton(
            icon: Icons.content_copy_outlined,
            onTap: controller.copySelectedText,
          ),
          _MenuIconButton(
            icon: Icons.search,
            onTap: () {
              // TODO: Implement search
            },
          ),
          _MenuIconButton(
            icon: Icons.share_outlined,
            onTap: controller.sendToQuotePage,
          ),
        ],
      ),
    );
  }
}

class _HighlightColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const _HighlightColorButton({required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22.w,
        height: 22.h,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class _MenuIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MenuIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, size: 20.sp, color: AppColors.black),
      ),
    );
  }
}
