import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/bookshelf_view/bookshelf_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/goal_view/goal_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/quotation_view/quotation_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/wall_view/wall_view.dart';
import 'package:kitap_yuzu_profil/feature/profile/widgets/profile_statistics_box_widget.dart';
import 'package:kitap_yuzu_profil/feature/profile/widgets/user_info_widget.dart';

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
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  _ProfileBannerWidget(),

                  Positioned(
                    top: 75,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.black,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.backgroundColor,
                        child: Icon(Icons.person, size: AppDimens.xl),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimens.xl),
              //user info
              UserInfoWidget(),
              SizedBox(height: AppDimens.s),
              CustomButton(text: 'Profili düzenle'),
              SizedBox(height: AppDimens.s),
              Divider(),
              _buildStatistics(),
              Divider(),
              _buildTabBar(),
              Expanded(child: _buildTabBarView()),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildStatistics() {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [ProfileStatisticsBox(), ProfileStatisticsBox()],
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
        WallView(),
        QuotationView(),
        Center(child: Text('İnceleme')),
        GoalView(),
      ],
    );
  }
}
