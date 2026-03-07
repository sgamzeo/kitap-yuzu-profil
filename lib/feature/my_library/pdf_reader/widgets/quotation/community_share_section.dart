import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_section.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/quotation_controller.dart';

class CommunityShareSection extends GetView<QuotationController> {
  const CommunityShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'Toplulukta Paylaş',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: _CommunityTag()),
              SizedBox(width: AppDimens.s),
              CustomButton(
                onPressed: controller.onAddCommunity,
                text: 'Ekle',
                color: AppColors.wireframe3,
                radius: AppDimens.textFieldRadius,
              ),
            ],
          ),
          SizedBox(height: AppDimens.fieldSpacing),
          Text(
            'Alıntı "Topluluk ismi" isimli toplulukta paylaşılacaktır',
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class _CommunityTag extends StatelessWidget {
  const _CommunityTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.communityTagPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimens.communityTagRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('"Topluluk ismi"'),
          SizedBox(width: AppDimens.fieldSpacing),
          Icon(Icons.close, size: AppDimens.communityIconSize),
        ],
      ),
    );
  }
}
