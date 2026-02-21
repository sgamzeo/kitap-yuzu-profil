import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/text_keys.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  const AuthHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Column(
          children: [
            Text(
              AppTextKeys.appName,
              style: Theme.of(
                context,
              ).textTheme.osH2.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: AppDimens.l),
            Text(title, style: Theme.of(context).textTheme.osH4),
          ],
        ),
      ],
    );
  }
}
