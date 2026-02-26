import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/mock/profile_mock.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

part './widgets/profile_banner_widget.dart';
part './widgets/follow_stats_box_widget.dart';
part './widgets/user_info_widget.dart';
part './widgets/profile_statistics_box_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            _ProfileBannerWidget(),
            Container(color: AppColors.secondary),
          ],
        ),
        SizedBox(height: AppDimens.xl),
        //user info
        _UserInfoWidget(),

        SizedBox(height: AppDimens.s),
      ],
    );
  }
}
