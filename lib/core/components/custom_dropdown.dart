import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_outlined_button.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';

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

      child: Builder(
        builder: (context) {
          return CustomOutlinedButton(
            text: labelBuilder?.call(value) ?? value.toString(),
            icon: IconConstants.down,
            onPressed: () {
              PopupMenuButtonState<T>? popup = context
                  .findAncestorStateOfType<PopupMenuButtonState<T>>();
              popup?.showButtonMenu();
            },
          );
        },
      ),
    );
  }
}
