import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: const [
        _LibrarySection(
          title: 'Okuyorum',
          subtitle: '8 Kitap',
          icon: Icons.remove_red_eye_outlined,
        ),
        _LibrarySection(
          title: 'Okuduklarım',
          subtitle: '8 Kitap',
          icon: Icons.nights_stay_outlined,
        ),
      ],
    );
  }
}

class _LibrarySection extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

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
                      Text(title, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(width: 6),
                      Icon(icon, color: Color(0xFF8A8A8A), size: 16),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Color(0xFF8A8A8A)),
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
