import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_icon_button.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/pdf_reader_controller.dart';

class PdfReaderAppBar extends GetView<PdfReaderController>
    implements PreferredSizeWidget {
  final Color backgroundColor;

  const PdfReaderAppBar({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconButton(
            assetPath: IconConstants.cancel,
            onTap: controller.onClose,
            size: AppDimens.appBarIconSize,
            color: Colors.black,
          ),
          CustomIconButton(
            assetPath: IconConstants.quotations,
            onTap: controller.onOpenQuotations,
            size: AppDimens.appBarIconSize,
            color: Colors.black,
          ),
        ],
      ),
      actions: [
        CustomIconButton(
          assetPath: IconConstants.search2,
          onTap: controller.onSearch,
          size: AppDimens.appBarIconSize,
          color: Colors.black,
        ),
        CustomIconButton(
          assetPath: IconConstants.save,
          onTap: controller.onSave,
          size: AppDimens.appBarIconSize,
          color: Colors.black,
        ),
        CustomIconButton(
          assetPath: IconConstants.options,
          onTap: () => controller.onOpenAppearance(context),
          size: AppDimens.appBarIconSize,
          color: Colors.black,
        ),
        SizedBox(width: AppDimens.appBarSpacing),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
