import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_bottomsheet.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_dropdown.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';

class ReaderAppearanceBottomSheet extends GetView<PdfReaderController> {
  const ReaderAppearanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final appearance = controller.appearance.value;

      return CustomBottomSheet(
        title: "Görünüm",

        onPressed: Get.back,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.s,
            vertical: AppDimens.m,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReaderSettingsItem(
                title: "Yazı Tipi",
                child: CustomDropdown<ReaderFont>(
                  value: appearance.font,
                  items: ReaderFont.values,
                  labelBuilder: (f) => f.label,
                  onChanged: controller.changeFont,
                ),
              ),

              SizedBox(height: AppDimens.m),

              ReaderSettingsItem(
                title: "Yazı Boyutu",
                child: CustomDropdown<ReaderFontSize>(
                  value: appearance.fontSize,
                  items: ReaderFontSize.values,
                  labelBuilder: (s) => s.value.toInt().toString(),
                  onChanged: controller.changeFontSize,
                ),
              ),

              SizedBox(height: AppDimens.l),
              ReaderSettingsItem(
                title: "Arka Plan",
                vertical: true,
                child: BackgroundSelector(
                  selected: appearance.background,
                  customColor: appearance.customBackgroundColor,
                  onSelect: controller.changeBackground,
                ),
              ),

              SizedBox(height: AppDimens.l),

              ReaderSettingsItem(
                title: "Kaydırma Modu",
                vertical: true,
                child: DisplayModeSelector(
                  selected: appearance.displayMode,
                  onSelect: controller.changeDisplayMode,
                ),
              ),
              SizedBox(height: AppDimens.l),
              CustomButton(text: 'Kaydet', onPressed: Get.back),
            ],
          ),
        ),
      );
    });
  }
}

class BackgroundSelector extends StatelessWidget {
  final ReaderBackground selected;
  final Color? customColor;
  final ValueChanged<ReaderBackground> onSelect;

  const BackgroundSelector({
    super.key,
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

        return BackgroundOptionChip(
          type: bg,
          color: color,
          onTap: () async {
            if (bg == ReaderBackground.custom) {
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
                final controller = Get.find<PdfReaderController>();

                controller.changeCustomBackground(picked);
              }
            } else {
              onSelect(bg);
            }
          },
        );
      }).toList(),
    );
  }
}

class DisplayModeSelector extends StatelessWidget {
  final ReaderDisplayMode selected;
  final ValueChanged<ReaderDisplayMode> onSelect;

  const DisplayModeSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ReaderDisplayMode.values.map((mode) {
        return DisplayModeChip(
          selected: selected == mode,
          iconPath: mode.iconPath,
          onTap: () => onSelect(mode),
        );
      }).toList(),
    );
  }
}

class ReaderSettingsItem extends StatelessWidget {
  final String title;
  final Widget child;
  final bool vertical;

  const ReaderSettingsItem({
    super.key,
    required this.title,
    required this.child,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(
      context,
    ).textTheme.osP.copyWith(color: AppColors.wireframeMetin1);

    if (vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: child,
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle),
        child,
      ],
    );
  }
}

class BackgroundOptionChip extends StatelessWidget {
  final ReaderBackground type;
  final Color color;
  final VoidCallback onTap;

  const BackgroundOptionChip({
    super.key,
    required this.type,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = color.computeLuminance() < 0.5
        ? Colors.white
        : Colors.black;

    const rainbow = SweepGradient(
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.red,
      ],
    );

    final isWhite = type == ReaderBackground.white;
    final isCustom = type == ReaderBackground.custom;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 47,
        height: 46,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// rainbow border
            if (isCustom)
              Container(
                width: 47,
                height: 46,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: rainbow,
                ),
              ),

            /// green border
            if (isWhite)
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

            /// inner circle
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
                  color: isCustom ? Colors.black : textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayModeChip extends StatelessWidget {
  final bool selected;
  final String iconPath;
  final VoidCallback onTap;

  const DisplayModeChip({
    super.key,
    required this.selected,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 71.42,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? AppColors.secondaryColorYesil3 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? AppColors.secondaryColorYesil3
                : const Color(0xFFE5E5E5),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          iconPath,
          width: 16,
          height: 16,
          colorFilter: selected
              ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}
