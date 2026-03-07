import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class CustomSection extends StatelessWidget {
  final String title;
  final Widget child;
  final TextStyle? titleStyle;
  final double? spacing;

  const CustomSection({
    super.key,
    required this.title,
    required this.child,
    this.titleStyle,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        SizedBox(height: spacing ?? AppDimens.fieldSpacing),
        child,
      ],
    );
  }
}
