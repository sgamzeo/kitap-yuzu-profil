import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/bookshelf_view/bookshelf_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/goal_view/goal_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/quotation_view/quotation_view.dart';

part 'widgets/profile_banner_widget.dart';

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
              _ProfileBannerWidget(),
              _buildTabBar(),
              Expanded(child: _buildTabBarView()),
            ],
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      indicatorSize: .tab,
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      indicatorColor: AppColors.primary,
      indicatorWeight: 2,
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.unselectedLabelColor,
      tabs: tabs,
    );
  }

  TabBarView _buildTabBarView() {
    return const TabBarView(
      children: [
        BookshelfView(),
        Center(child: Text('Duvar')),
        QuotationView(),
        Center(child: Text('İnceleme')),
        GoalView(),
      ],
    );
  }
}
