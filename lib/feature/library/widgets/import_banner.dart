import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

class ImportBanner extends StatelessWidget {
  const ImportBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.green5,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Color(0xFFE1E6D8),
              child: Icon(Icons.download, color: Colors.black),
            ),
            SizedBox(width: 12),
            Expanded(child: Text('Goodreads / Diğer Platformlardan Aktar')),
          ],
        ),
      ),
    );
  }
}
