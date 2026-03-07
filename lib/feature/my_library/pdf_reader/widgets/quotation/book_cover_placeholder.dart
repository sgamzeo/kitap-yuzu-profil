import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class BookCoverPlaceholder extends StatelessWidget {
  const BookCoverPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.bookCoverWidth,
      height: AppDimens.bookCoverHeight,
      decoration: BoxDecoration(
        color: AppColors.wireframe1,
        borderRadius: BorderRadius.circular(AppDimens.bookCoverRadius),
      ),
      child: const Icon(Icons.add),
    );
  }
}
