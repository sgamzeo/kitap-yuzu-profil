import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/notifications/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Colors.white
            : AppColors.secondaryColorSari4,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: Theme.of(
                          context,
                        ).textTheme.osP.copyWith(color: AppColors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          notification.time,
                          style: Theme.of(
                            context,
                          ).textTheme.osS2.copyWith(color: AppColors.tertiary),
                        ),
                        if (!notification.isRead) ...[
                          SizedBox(width: 8.w),
                          Container(
                            width: 8.r,
                            height: 8.r,
                            decoration: const BoxDecoration(
                              color: AppColors.tabBarYellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                if (notification.avatars != null &&
                    notification.avatars!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: _buildAvatars(),
                  ),
                Text(
                  notification.message,
                  style: Theme.of(
                    context,
                  ).textTheme.osS.copyWith(color: AppColors.tertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (notification.type == NotificationType.article) {
      return Container(
        width: 33.r,
        height: 33.r,
        decoration: BoxDecoration(
          color: AppColors.secondaryColorSari3,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: SvgPicture.asset(
            IconConstants.communityFilled,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    }

    IconData iconData;

    switch (notification.type) {
      case NotificationType.follower:
        iconData = Icons.person;
        break;
      case NotificationType.article:
        iconData = Icons.article;
        break;
      case NotificationType.like:
        iconData = Icons.thumb_up;
        break;
      case NotificationType.save:
        iconData = Icons.bookmark;
        break;
      case NotificationType.tag:
        iconData = Icons.group;
        break;
    }

    return Container(
      width: 33.r,
      height: 33.r,
      decoration: BoxDecoration(
        color: AppColors.secondaryColorSari3,
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, size: 24.r, color: AppColors.primary),
    );
  }

  Widget _buildAvatars() {
    return Row(
      children: [
        for (int i = 0; i < notification.avatars!.length && i < 2; i++)
          Container(
            margin: EdgeInsets.only(right: 4.w),
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: Icon(Icons.person, size: 16.r, color: AppColors.gray500),
            ),
          ),
      ],
    );
  }
}
