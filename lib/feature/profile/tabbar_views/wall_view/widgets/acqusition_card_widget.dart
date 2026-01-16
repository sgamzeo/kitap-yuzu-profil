import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class AcqusitionCardWidget extends StatelessWidget {
  const AcqusitionCardWidget({super.key});

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
            CircleAvatar(),
            SizedBox(width: AppDimens.m),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Topluluk Lideri 👑",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Icon(Icons.verified_outlined, size: 16),
                    ],
                  ),
                  Text(
                    'Kurduğu kitap kulübü 100 üyeyi geçen ve aktif etkileşim sağlayan öncüler içindir.',
                  ),
                  Text('2023te kazanıldı.', style: TextStyle(fontSize: 11.1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
