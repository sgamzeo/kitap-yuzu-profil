import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_bottomsheet.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_dropdown.dart';
import 'package:kitap_yuzu_profil/core/constants/enums/pdf_reader_enums.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';
import 'appearance_components.dart';

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
              SettingRow(
                title: "Yazı Tipi",
                child: CustomDropdown<ReaderFont>(
                  value: appearance.font,
                  items: ReaderFont.values,
                  labelBuilder: (f) => f.label,
                  onChanged: controller.changeFont,
                ),
              ),
              SizedBox(height: AppDimens.m),
              SettingRow(
                title: "Yazı Boyutu",
                child: CustomDropdown<ReaderFontSize>(
                  value: appearance.fontSize,
                  items: ReaderFontSize.values,
                  labelBuilder: (s) => s.value.toInt().toString(),
                  onChanged: controller.changeFontSize,
                ),
              ),
              SizedBox(height: AppDimens.l),
              SettingColumn(
                title: "Arka Plan",
                child: BackgroundRow(
                  selected: appearance.background,
                  customColor: appearance.customBackgroundColor,
                  onSelect: controller.changeBackground,
                ),
              ),
              SizedBox(height: AppDimens.l),
              SettingColumn(
                title: "Kaydırma Modu",
                child: DisplayModeRow(
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
