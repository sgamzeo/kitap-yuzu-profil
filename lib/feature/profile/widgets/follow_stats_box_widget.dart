import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class FollowStatsBoxWidget extends StatelessWidget {
  final int count;
  final String label;
  const FollowStatsBoxWidget({
    required this.count,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${count} ',
            style: Theme.of(context).textTheme.small2,
          ),
          TextSpan(
            text: label,
            style: Theme.of(
              context,
            ).textTheme.small2.copyWith(color: AppColors.wireframeMetin2),
          ),
        ],
      ),
    );
  }
}
