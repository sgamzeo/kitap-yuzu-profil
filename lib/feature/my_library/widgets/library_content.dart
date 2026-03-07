import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: [
        _LibrarySection(
          title: 'Okuyorum',
          subtitle: '8 Kitap',
          icon: IconConstants.open,
        ),
        _LibrarySection(
          title: 'Okuduklarım',
          subtitle: '8 Kitap',
          icon: IconConstants.close,
        ),
      ],
    );
  }
}

class _LibrarySection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;

  const _LibrarySection({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 87,
              height: 87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColors.yellow3,
              ),
              child: Image.asset(
                'assets/atomic_habits.png',
                width: 75,
                height: 75,
                fit: BoxFit.none,
              ),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.osP.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset(
                        icon,
                        color: AppColors.mutedText,
                        height: 16,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: AppColors.mutedText,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.s),

                  Text(
                    subtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.osS.copyWith(color: AppColors.mutedText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
