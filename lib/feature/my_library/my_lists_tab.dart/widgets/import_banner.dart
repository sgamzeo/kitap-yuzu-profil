import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class ImportBanner extends StatelessWidget {
  const ImportBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.green5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFFE1E6D8),
              child: SvgPicture.asset(IconConstants.importBoldDuoTone),
            ),
            SizedBox(width: AppDimens.m),
            Expanded(
              child: Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.osS,
                  children: [
                    TextSpan(
                      text: 'Goodreads / Diğer ',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    TextSpan(
                      text: 'Platformlardan Aktar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
