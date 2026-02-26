import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return OutlinedButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,

      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.s, vertical: AppDimens.xs),
        ),

        side: const WidgetStatePropertyAll(
          BorderSide(color: AppColors.primary, width: 0.5),
        ),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),

      icon: SvgPicture.asset(
        icon,
        color: AppColors.tertiary,
        alignment: .centerLeft,
      ),

      label: Text(
        text,
        style: textTheme.osS.copyWith(color: AppColors.tertiary),
        textAlign: .end,
      ),
    );
  }
}
