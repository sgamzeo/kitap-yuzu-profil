import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Okumaya Devam Et',
          style: textTheme.osH6.copyWith(color: AppColors.black),
        ),

        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Cover
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/company_of_one.png',
                width: 75,
                height: 103,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            // Text Side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Company of One',
                    style: textTheme.osH6.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Paul Jarvis',
                    style: textTheme.osP.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.osS2.copyWith(
                      color: AppColors.wireframeMetin2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: 0.0,
                            minHeight: 6,
                            backgroundColor: Colors.grey[300],
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '% 0',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
