import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class AcqusitionCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String avatar;
  final String caption;
  const AcqusitionCardWidget({
    required this.title,
    required this.description,
    required this.caption,
    required this.avatar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: .circular(10),
      ),
      child: Padding(
        padding: AppDimens.cardM,
        child: Row(
          children: [
            CircleAvatar(radius: 28, backgroundImage: AssetImage(avatar)),
            SizedBox(width: AppDimens.m),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Icon(Icons.verified_outlined, size: 16),
                    ],
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(caption, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
