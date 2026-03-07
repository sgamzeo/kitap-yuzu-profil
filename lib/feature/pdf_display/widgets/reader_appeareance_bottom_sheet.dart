import 'package:flutter/material.dart';
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
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: ReaderBackground.values.map((bg) {
        final color = bg.resolve(customColor);
        final isSelected = bg == selected;

        final textColor = color.computeLuminance() < 0.5
            ? Colors.white
            : Colors.black;

        return GestureDetector(
          onTap: () => onSelect(bg),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2)
                  : null,
            ),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 18,
              child: Text("Aa", style: TextStyle(color: textColor)),
            ),
          ),
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
    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: ReaderDisplayMode.values.map((mode) {
        final isSelected = selected == mode;

        return GestureDetector(
          onTap: () => onSelect(mode),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade300,
              ),
              color: isSelected ? AppColors.primary.withOpacity(.1) : null,
            ),
            child: SvgPicture.asset(
              mode.iconPath,
              width: 22,
              height: 22,
              colorFilter: isSelected
                  ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                  : null,
            ),
          ),
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
    if (vertical) {
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
          Center(child: child),
        ],
      );
    }

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
