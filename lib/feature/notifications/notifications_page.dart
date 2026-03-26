import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/notifications/notifications_controller.dart';
import 'package:kitap_yuzu_profil/feature/notifications/widgets/notification_item.dart';

class NotificationsPage extends GetView<NotificationsController> {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(IconConstants.back, width: 24.r, height: 24.r),
        ),
        title: Text(
          'Bildirimler',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              IconConstants.settings,
              width: 24.r,
              height: 24.r,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Text(
              'Henüz bildirim yok',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.mutedText),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          itemCount: controller.notifications.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.notifications.length) {
              return _buildClearButton();
            }
            return NotificationItem(
              notification: controller.notifications[index],
            );
          },
        );
      }),
    );
  }

  Widget _buildClearButton() {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: TextButton(
        onPressed: () => controller.clearNotifications(),
        child: Text(
          'Bildirimleri temizle',
          style: TextStyle(fontSize: 14.sp, color: AppColors.mutedText),
        ),
      ),
    );
  }
}
