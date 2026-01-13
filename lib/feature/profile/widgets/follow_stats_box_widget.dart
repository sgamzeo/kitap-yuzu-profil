import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class FollowStatsBoxWidget extends StatelessWidget {
  const FollowStatsBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("12.5B"),
        SizedBox(width: AppDimens.xs),
        Text('Takipçiler', style: TextStyle(fontWeight: .w600)),
      ],
    );
  }
}
