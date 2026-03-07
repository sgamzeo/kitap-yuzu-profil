import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final String Function(T)? labelBuilder;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: onChanged,
      itemBuilder: (context) => items
          .map(
            (item) => PopupMenuItem<T>(
              value: item,
              child: Text(labelBuilder?.call(item) ?? item.toString()),
            ),
          )
          .toList(),
      child: Container(
        height: AppDimens.xl,
        padding: EdgeInsets.symmetric(horizontal: AppDimens.s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.5, color: const Color(0xFFE5E5E5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labelBuilder?.call(value) ?? value.toString(),
              style: Theme.of(
                context,
              ).textTheme.osS.copyWith(color: AppColors.wireframe2),
            ),
            SizedBox(width: AppDimens.xs),
            Icon(Icons.keyboard_arrow_down, size: AppDimens.m),
          ],
        ),
      ),
    );
  }
}
