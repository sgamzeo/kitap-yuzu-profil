import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/profile/widgets/follow_stats_box_widget.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.currentUser});

  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(currentUser),

          Text("@sgamzeo"),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada ut quam id laoreet. Pellentesque sed neque libero. ",
            textAlign: .center,
          ),

          SizedBox(height: AppDimens.l),
          Row(
            mainAxisAlignment: .center,
            children: [
              FollowStatsBoxWidget(),
              SizedBox(width: AppDimens.m),
              FollowStatsBoxWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
