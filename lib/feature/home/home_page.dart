import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/home/home_controller.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/community/community_view.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/feed/feed_view.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/messages/messages_view.dart';
import 'package:kitap_yuzu_profil/feature/home/navbar/recents/recents_view.dart';
import 'package:kitap_yuzu_profil/feature/my_library/my_library_view.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  static final List<String> _navIcons = [
    IconConstants.navbarHome,
    IconConstants.navbarRecents,
    IconConstants.navbarLibrary,
    IconConstants.navbarCommunity,
    IconConstants.navbarMessages,
  ];

  static final List<Widget> _pages = [
    const FeedView(),
    const RecentsView(),
    MyLibraryView(),
    const CommunityView(),
    const MessagesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final showAppBar = controller.currentIndex.value != 2; // Library index

      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: showAppBar ? _buildAppBar() : null,
        body: _pages[controller.currentIndex.value],
        // bottomNavigationBar: _buildBottomNavBar(), // Temporarily hidden
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // TODO: Logo action
              },
              icon: SvgPicture.asset(
                IconConstants.homeKibana,
                width: 24.r,
                height: 24.r,
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 60.w,
      title: IconButton(
        onPressed: () {
          // TODO: Menu action
        },
        icon: SvgPicture.asset(
          IconConstants.homeMenu,
          width: 28.r,
          height: 28.r,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Search action
          },
          icon: SvgPicture.asset(
            IconConstants.homeSearch,
            width: 24.r,
            height: 24.r,
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Notifications action
          },
          icon: SvgPicture.asset(
            IconConstants.homeNotifications,
            width: 24.r,
            height: 24.r,
          ),
        ),
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.profile),
          icon: SvgPicture.asset(
            IconConstants.homeProfile,
            width: 24.r,
            height: 24.r,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(40.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _navIcons.length,
          (index) => _buildNavItem(_navIcons[index], index),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.foundationAccent3
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            iconPath,
            width: 24.r,
            height: 24.r,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      );
    });
  }
}
