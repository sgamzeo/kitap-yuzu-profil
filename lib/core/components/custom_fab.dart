import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

class CustomFab extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.r,
      height: 45.r,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.secondaryColorYesil2,
        elevation: 0,
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          IconConstants.add,
          width: 18.r,
          height: 18.r,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
