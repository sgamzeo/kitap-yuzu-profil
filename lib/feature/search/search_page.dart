import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_outlined_button.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/search/search_controller.dart'
    as search;

class SearchPage extends GetView<search.SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16.w,
        title: Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.wireframe5,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(Icons.search, color: AppColors.gray500, size: 24.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: controller.searchTextController,
                  decoration: InputDecoration(
                    hintText: 'Kitaplar içinde ara',
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.gray500),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  onChanged: (value) => controller.onSearchChanged(value),
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.close, color: AppColors.gray700, size: 24.r),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildFilterChips(),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Son Aramalar',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Obx(() {
              if (controller.recentSearches.isEmpty) {
                return Center(
                  child: Text(
                    'Henüz arama yapmadınız',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.mutedText),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: controller.recentSearches.length,
                itemBuilder: (context, index) {
                  return _buildRecentSearchItem(
                    context,
                    controller.recentSearches[index],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            CustomOutlinedButton(
              text: 'Kitaplar',
              isSelected: controller.selectedFilterIndex.value == 0,
              onPressed: () => controller.selectFilter(0),
            ),
            SizedBox(width: 8.w),
            CustomOutlinedButton(
              text: 'Topluluklar',
              isSelected: controller.selectedFilterIndex.value == 1,
              onPressed: () => controller.selectFilter(1),
            ),
            SizedBox(width: 8.w),
            CustomOutlinedButton(
              text: 'Kullanıcılar',
              isSelected: controller.selectedFilterIndex.value == 2,
              onPressed: () => controller.selectFilter(2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchItem(BuildContext context, String searchText) {
    return InkWell(
      onTap: () => controller.onRecentSearchTap(searchText),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Icon(Icons.history, color: AppColors.gray500, size: 22.r),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                '"$searchText"',
                style: Theme.of(
                  context,
                ).textTheme.osP.copyWith(color: AppColors.wireframeMetin2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
