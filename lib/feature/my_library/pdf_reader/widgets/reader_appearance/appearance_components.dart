import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingRow({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.osP.copyWith(color: AppColors.wireframeMetin1),
        ),
        child,
      ],
    );
  }
}

class SettingColumn extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingColumn({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.osP.copyWith(color: AppColors.wireframeMetin1),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: child,
        ),
      ],
    );
  }
}

class BackgroundRow extends StatelessWidget {
  final ReaderBackground selected;
  final Color? customColor;
  final ValueChanged<ReaderBackground> onSelect;

  const BackgroundRow({
    required this.selected,
    required this.onSelect,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ReaderBackground.values.map((bg) {
        final color = bg.resolve(customColor);
        final isSelected = selected == bg;
        final isWhite = bg == ReaderBackground.white;
        final isCustom = bg == ReaderBackground.custom;

        return GestureDetector(
          onTap: () async {
            if (isCustom) {
              Color temp = customColor ?? Colors.blue;
              final picked = await showDialog<Color>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Renk seç"),
                  content: BlockPicker(
                    pickerColor: temp,
                    onColorChanged: (c) => temp = c,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("İptal"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, temp),
                      child: const Text("Seç"),
                    ),
                  ],
                ),
              );
              if (picked != null) {
                Get.find<PdfReaderController>().changeCustomBackground(picked);
              }
            } else {
              onSelect(bg);
            }
          },
          child: SizedBox(
            width: 47,
            height: 46,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isCustom)
                  Container(
                    width: 47,
                    height: 46,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.purple,
                          Colors.red,
                        ],
                      ),
                    ),
                  ),
                if (isWhite && isSelected)
                  Container(
                    width: 47,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryColorYesil3,
                        width: 2,
                      ),
                    ),
                  ),
                Container(
                  width: 43,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCustom ? Colors.white : color,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Aa",
                    style: TextStyle(
                      color: isCustom
                          ? Colors.black
                          : (color.computeLuminance() < 0.5
                                ? Colors.white
                                : Colors.black),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DisplayModeRow extends StatelessWidget {
  final ReaderDisplayMode selected;
  final ValueChanged<ReaderDisplayMode> onSelect;

  const DisplayModeRow({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ReaderDisplayMode.values.map((mode) {
        final isSelected = selected == mode;
        return GestureDetector(
          onTap: () => onSelect(mode),
          child: Container(
            width: 71.42,
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.secondaryColorYesil3 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? AppColors.secondaryColorYesil3
                    : const Color(0xFFE5E5E5),
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              mode.iconPath,
              width: 16,
              height: 16,
              colorFilter: isSelected
                  ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
