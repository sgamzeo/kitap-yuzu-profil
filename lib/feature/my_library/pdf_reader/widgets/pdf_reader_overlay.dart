import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class PdfReaderOverlay extends GetView<PdfReaderController> {
  const PdfReaderOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isUIVisible.value) {
        return const SizedBox.shrink();
      }

      return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: _buildBottomMenu(),
      );
    });
  }

  Widget _buildBottomMenu() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.m,
          vertical: AppDimens.m,
        ),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _MenuButton(
              label: "Metin",
              onTap: () {
                // TODO: Implement text selection/copy
              },
            ),
            _MenuButton(
              label: "Seslendir",
              onTap: () {
                // TODO: Implement options
              },
            ),
            _MenuButton(
              label: "Oto Kaydır",
              onTap: () {
                // TODO: Implement auto scroll
              },
            ),
            _MenuButton(
              label: "Görünüm",
              onTap: () => controller.onOpenAppearance(Get.context!),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MenuButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80.w,
            height: 53.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.secondaryColorYesil5,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              IconConstants.textAa,
              width: 28.w,
              height: 18.h,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: AppColors.wireframe2),
          ),
        ],
      ),
    );
  }
}
