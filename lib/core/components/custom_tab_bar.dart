import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,

      padding: AppDimens.defaultPagePadding,
      labelPadding: EdgeInsets.only(right: AppDimens.s),

      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 1, color: AppColors.tabBarYellow),
        insets: const EdgeInsets.only(bottom: 10),
      ),

      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,

      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.mutedText,

      labelStyle: Theme.of(context).textTheme.osP,
      unselectedLabelStyle: Theme.of(context).textTheme.osP,

      tabs: tabs.map((e) => Tab(text: e)).toList(),
    );
  }
}
