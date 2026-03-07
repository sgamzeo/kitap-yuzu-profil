import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/quotation_controller.dart';

class ShareButton extends GetView<QuotationController> {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.quotationButtonHeight,
      child: CustomButton(
        onPressed: controller.onSubmit,
        text: 'Paylaş',
        color: AppColors.wireframe3,
        radius: AppDimens.buttonRadius,
      ),
    );
  }
}
