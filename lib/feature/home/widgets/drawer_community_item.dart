import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitap_yuzu_profil/core/components/count_badge.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class DrawerCommunityItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final String title;
  final int count;
  final Color? countColor;

  const DrawerCommunityItem({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.title,
    required this.count,
    this.countColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to community
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, size: 20.r, color: AppColors.black),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.osS.copyWith(color: AppColors.tertiary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CountBadge(count: count, backgroundColor: countColor),
          ],
        ),
      ),
    );
  }
}
