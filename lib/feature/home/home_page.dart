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
import 'package:kitap_yuzu_profil/feature/home/widgets/home_drawer.dart';
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
    const MyLibraryView(),
    const CommunityView(),
    const MessagesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final showAppBar = controller.currentIndex.value == 0; // Only Feed index

      return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        appBar: showAppBar ? _buildAppBar() : null,
        drawer: const HomeDrawer(),
        body: _pages[controller.currentIndex.value],
        bottomNavigationBar: _buildBottomNavBar(),
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.menu, color: AppColors.gray700, size: 28.r),
        ),
      ),
      titleSpacing: 0,
      title: Builder(
        builder: (context) => InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.search);
          },
          borderRadius: BorderRadius.circular(28.r),
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.wireframe5,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Icon(
                    Icons.search,
                    color: AppColors.gray500,
                    size: 24.r,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kitaplar içinde ara',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.notifications),
          icon: Icon(
            Icons.notifications_outlined,
            color: AppColors.gray700,
            size: 28.r,
          ),
        ),
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.profile),
          icon: Icon(
            Icons.account_circle_outlined,
            color: AppColors.gray700,
            size: 28.r,
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
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
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
        child: SizedBox(
          height: 40.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                Positioned(
                  top: 0,
                  child: Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      color: AppColors.tabBarYellow,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.tabBarYellow.withOpacity(0.5),
                          blurRadius: 8.r,
                          spreadRadius: 2.r,
                        ),
                      ],
                    ),
                  ),
                ),
              Center(
                child: Container(
                  decoration: isSelected
                      ? BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tabBarYellow.withOpacity(0.3),
                              blurRadius: 12.r,
                              spreadRadius: 2.r,
                            ),
                          ],
                        )
                      : null,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 24.r,
                    height: 24.r,
                    colorFilter: ColorFilter.mode(
                      isSelected ? AppColors.tabBarYellow : Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
