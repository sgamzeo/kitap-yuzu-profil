import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/profile/profile_header/profile_header.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/bookshelf_view/bookshelf_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/goal_view/goal_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/quotation_view/quotation_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/wall_view/wall_view.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final tabs = [
    Tab(text: 'Kitaplık'),
    Tab(text: 'Duvar'),
    Tab(text: 'Alıntı'),
    Tab(text: 'İncelemeler'),
    Tab(text: 'Hedefler'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: DefaultTabController(
          length: tabs.length,
          child: Column(
            children: [
              ProfileHeader(),
              TabBar(
                indicatorSize: .tab,
                overlayColor: WidgetStateProperty.all(AppColors.transparent),
                indicatorColor: const Color(0xFFE9CF84),
                indicatorWeight: 2,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.unselectedLabelColor,
                tabs: tabs,
              ),

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
      ),
    );
  }
}
