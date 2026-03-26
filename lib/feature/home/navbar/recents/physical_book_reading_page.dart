import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class PhysicalBookReadingPage extends StatelessWidget {
  const PhysicalBookReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            IconConstants.cancel,
            width: 24.r,
            height: 24.r,
            colorFilter: const ColorFilter.mode(
              AppColors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Fiziksel Kitap Okuma',
          style: Theme.of(
            context,
          ).textTheme.osH6.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              IconConstants.options,
              width: 24.r,
              height: 24.r,
              colorFilter: const ColorFilter.mode(
                AppColors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              '"Kitap İsmi"',
              style: Theme.of(
                context,
              ).textTheme.osH6.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            _buildTimer(),
            SizedBox(height: 60.h),
            _buildNotesSection(context),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.secondaryColorYesil2,
          elevation: 0,
          child: Icon(Icons.add, color: AppColors.primary, size: 28.r),
        ),
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.wireframe5,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        '00.00.01',
        style: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.black,
          letterSpacing: 3,
        ),
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Eklenen Alıntılar',
          style: Theme.of(context).textTheme.osP.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        _buildNoteItem(
          context,
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "',
          '20.11.2025 | Saat',
          false,
        ),
        SizedBox(height: 12.h),
        _buildNoteItem(
          context,
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "',
          '20.11.2025 | Saat',
          true,
        ),
      ],
    );
  }

  Widget _buildNoteItem(
    BuildContext context,
    String text,
    String time,
    bool showDelete,
  ) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.wireframe5,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.osS.copyWith(
                  color: AppColors.tertiary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: Theme.of(
                      context,
                    ).textTheme.osS2.copyWith(color: AppColors.tertiary),
                  ),
                  SvgPicture.asset(
                    IconConstants.export,
                    width: 20.r,
                    height: 20.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.tertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showDelete)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete_outline, color: Colors.white, size: 24.r),
                  SizedBox(height: 4.h),
                  Text(
                    'Sil',
                    style: Theme.of(context).textTheme.osS2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 56.r,
              height: 56.r,
              decoration: BoxDecoration(
                color: AppColors.wireframe5,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.pause, size: 28.r, color: AppColors.black),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'Seansı Bitir',
                    style: Theme.of(context).textTheme.osP.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
