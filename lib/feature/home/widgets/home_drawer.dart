import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/home/widgets/drawer_section.dart';
import 'package:kitap_yuzu_profil/feature/home/widgets/drawer_community_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFavoriteCommunities(),
                SizedBox(height: 12.h),
                _buildRecentlyVisited(),
                SizedBox(height: 12.h),
                _buildMyMemberships(),
                SizedBox(height: 12.h),
                _buildCreateCommunityButton(context),
                SizedBox(height: 12.h),
                _buildCurrentReadingBooks(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCommunities() {
    return DrawerSection(
      title: 'Favori topluluklar',
      isExpanded: true,
      children: [
        DrawerCommunityItem(
          icon: Icons.design_services,
          backgroundColor: AppColors.foundationAccent3,
          title: 'UX/UI Tasarımcıları',
          count: 5,
        ),
        DrawerCommunityItem(
          icon: Icons.code,
          backgroundColor: AppColors.primary,
          title: 'Python Türkiye 🐍',
          count: 12,
        ),
        DrawerCommunityItem(
          icon: Icons.camera_alt,
          backgroundColor: const Color(0xFFD4A574),
          title: 'Analog Fotoğrafçılık',
          count: 2,
        ),
        DrawerCommunityItem(
          icon: Icons.menu_book,
          backgroundColor: const Color(0xFFE8D4F0),
          title: 'Bilim Kurgu Kitap Kulübü',
          count: 100,
        ),
        DrawerCommunityItem(
          icon: Icons.palette,
          backgroundColor: const Color(0xFFFFD4A3),
          title: 'Soyut Sanat Atölyesi',
          count: 0,
        ),
        DrawerCommunityItem(
          icon: Icons.coffee,
          backgroundColor: const Color(0xFFD4A574),
          title: 'Girişimci Kafası',
          count: 1,
        ),
      ],
    );
  }

  Widget _buildRecentlyVisited() {
    return DrawerSection(
      title: 'Son ziyaret edilenler (174)',
      isExpanded: false,
      children: [
        DrawerCommunityItem(
          icon: Icons.restaurant,
          backgroundColor: const Color(0xFFD4F0D4),
          title: 'İtalyan Mutfağı Tarifleri',
          count: 3,
        ),
        DrawerCommunityItem(
          icon: Icons.currency_bitcoin,
          backgroundColor: const Color(0xFFFFD4A3),
          title: 'Kripto Haberleri',
          count: 150,
          countColor: AppColors.gray500,
        ),
        DrawerCommunityItem(
          icon: Icons.movie,
          backgroundColor: const Color(0xFFD4E4F0),
          title: 'Bağımsız Sinema',
          count: 8,
        ),
        DrawerCommunityItem(
          icon: Icons.science,
          backgroundColor: const Color(0xFFE8D4F0),
          title: 'Popüler Bilim',
          count: 2,
        ),
        DrawerCommunityItem(
          icon: Icons.spa,
          backgroundColor: AppColors.foundation2,
          title: 'Minimalizm',
          count: 0,
        ),
        DrawerCommunityItem(
          icon: Icons.psychology,
          backgroundColor: const Color(0xFFD4A574),
          title: 'Mizah ve Meme Paylaşım',
          count: 45,
        ),
        DrawerCommunityItem(
          icon: Icons.self_improvement,
          backgroundColor: const Color(0xFFD4D4F0),
          title: 'Yoga ve Meditasyon',
          count: 1,
        ),
        DrawerCommunityItem(
          icon: Icons.directions_car,
          backgroundColor: const Color(0xFFF0D4D4),
          title: 'Otomobil Tutkunları',
          count: 0,
        ),
        DrawerCommunityItem(
          icon: Icons.pets,
          backgroundColor: const Color(0xFFFFD4A3),
          title: 'Kedili Evler 🐱',
          count: 12,
        ),
      ],
    );
  }

  Widget _buildMyMemberships() {
    return DrawerSection(title: 'Üyeliklerim', isExpanded: false, children: []);
  }

  Widget _buildCreateCommunityButton(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Create community action
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.green5,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.add, size: 20.r, color: AppColors.primary),
            SizedBox(width: 12.w),
            Text(
              'Topluluk Oluştur',
              style: Theme.of(
                context,
              ).textTheme.osP.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentReadingBooks(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.green5,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Devam Ettiğim Kitaplar',
                  style: Theme.of(
                    context,
                  ).textTheme.osP.copyWith(color: AppColors.black),
                ),
              ),
              Transform.rotate(
                angle: 3.14159,
                child: SvgPicture.asset(
                  IconConstants.down,
                  width: 15,
                  height: 7.5,
                  colorFilter: const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: _buildBookGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookGrid() {
    final books = [
      'assets/mock/the_subtle_art_of_not_giving_fuck.jpg',
      'assets/mock/the_picture_of_dorian_gray.jpg',
      'assets/mock/narnia.jpg',
      'assets/mock/stupore_tremori.jpg',
      'assets/mock/the_subtle_art_of_not_giving_fuck.jpg',
      'assets/mock/the_picture_of_dorian_gray.jpg',
      'assets/mock/narnia.jpg',
      'assets/mock/stupore_tremori.jpg',
      'assets/mock/the_subtle_art_of_not_giving_fuck.jpg',
      'assets/mock/the_picture_of_dorian_gray.jpg',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.7,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            books[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.gray300,
                child: Icon(Icons.book, color: AppColors.gray500, size: 24.r),
              );
            },
          ),
        );
      },
    );
  }
}
