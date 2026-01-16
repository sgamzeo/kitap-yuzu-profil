import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/mock/profile_mock.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/profile/widgets/follow_stats_box_widget.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            ProfileMock.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
          ),

          Text(
            ProfileMock.username,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            ProfileMock.bio,
            textAlign: .center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.wireframeMetin2,
              fontWeight: .w200,
              fontStyle: .italic,
            ),
          ),

          SizedBox(height: AppDimens.s),
          Row(
            mainAxisAlignment: .center,
            children: [
              FollowStatsBoxWidget(
                count: ProfileMock.followers,
                label: 'Takipçiler',
              ),
              SizedBox(width: AppDimens.m),
              FollowStatsBoxWidget(
                count: ProfileMock.following,
                label: "Takip Ediliyor",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
