import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

part 'widgets/profile_banner_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final tabs = [Tab(text: 'Tab 1'), Tab(text: 'Tab 2'), Tab(text: 'Tab 3')];

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
        Center(child: Text('Tab 1 Content')),
        Center(child: Text('Tab 2 Content')),
        Center(child: Text('Tab 3 Content')),
      ],
    );
  }
}
