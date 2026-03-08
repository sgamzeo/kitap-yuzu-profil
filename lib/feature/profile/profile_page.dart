import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_tab_bar.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/profile/profile_header/profile_header.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/bookshelf_view/bookshelf_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/goal_view/goal_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/quotation_view/quotation_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/wall_view/wall_view.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final tabs = ['Kitaplık', 'Duvar', 'Alıntı', 'İncelemeler', 'Hedefler'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            ProfileHeader(),
            CustomTabBar(tabs: tabs),
            Expanded(
              child: const TabBarView(
                children: [
                  BookshelfView(),
                  WallView(),
                  QuotationView(),
                  Center(child: Text('İnceleme')),
                  GoalView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
