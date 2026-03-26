import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final String? icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = isSelected ? Colors.white : AppColors.tertiary;
    final bgColor = isSelected ? AppColors.wireframe1 : Colors.transparent;

    if (icon != null) {
      return OutlinedButton.icon(
        iconAlignment: IconAlignment.end,
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: WidgetStatePropertyAll(bgColor),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: AppDimens.s,
              vertical: AppDimens.xs,
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: AppColors.primary, width: 0.5),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        icon: SvgPicture.asset(icon!, color: textColor, alignment: .centerLeft),
        label: Text(
          text,
          style: textTheme.osS.copyWith(color: textColor),
          textAlign: .end,
        ),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: WidgetStatePropertyAll(bgColor),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppDimens.s, vertical: AppDimens.xs),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.primary, width: 0.5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      child: Text(text, style: textTheme.osS.copyWith(color: textColor)),
    );
  }
}
