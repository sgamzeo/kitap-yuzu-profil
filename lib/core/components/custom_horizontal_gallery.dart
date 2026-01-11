import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

class CustomHorizontalGallery extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;
  final int itemCount;
  const CustomHorizontalGallery({
    required this.title,
    required this.description,
    required this.child,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [_buildTitle(), _buildSeeAll()],
        ),
        SizedBox(height: AppDimens.s),
        _buildList(),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        Text(title, style: TextStyle(fontWeight: .w700)),
        SizedBox(width: AppDimens.xs),
        Text(
          description,
          style: TextStyle(color: AppColors.unselectedLabelColor),
        ),
      ],
    );
  }

  TextButton _buildSeeAll() {
    return TextButton(
      child: Text(
        "Tümünü Gör",
        style: TextStyle(color: AppColors.unselectedLabelColor),
      ),
      onPressed: () {},
    );
  }

  SizedBox _buildList() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return child;
        },
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemCount: itemCount,
      ),
    );
  }
}
