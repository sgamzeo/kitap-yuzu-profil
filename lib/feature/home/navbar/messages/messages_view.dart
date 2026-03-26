import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/count_badge.dart';
import 'package:kitap_yuzu_profil/core/components/custom_fab.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/messages/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(IconConstants.back, width: 24.r, height: 24.r),
        ),
        title: Text(
          'Mesajlarım',
          style: Theme.of(
            context,
          ).textTheme.osH6.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.messages.isEmpty) {
          return Center(
            child: Text(
              'Henüz mesaj yok',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.mutedText),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            return _buildMessageItem(context, message);
          },
        );
      }),
      floatingActionButton: CustomFab(
        onPressed: () {
          // Yeni mesaj oluşturma işlemi
        },
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, Map<String, dynamic> message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.wireframe5, width: 1),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.gray300,
            child: Icon(Icons.person, size: 28.r, color: AppColors.gray500),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'İsim ',
                        style: Theme.of(context).textTheme.osP.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text: message['username'],
                        style: Theme.of(
                          context,
                        ).textTheme.osP.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  message['message'],
                  style: Theme.of(
                    context,
                  ).textTheme.osS.copyWith(color: AppColors.tertiary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message['time'],
                style: Theme.of(
                  context,
                ).textTheme.osS.copyWith(color: AppColors.primary),
              ),
              if (message['unreadCount'] > 0) ...[
                SizedBox(height: 4.h),
                CountBadge(count: message['unreadCount']),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
