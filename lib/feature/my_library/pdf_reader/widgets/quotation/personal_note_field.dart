import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitap_yuzu_profil/core/components/custom_labeled_text_field.dart';

class PersonalNoteField extends StatelessWidget {
  final TextEditingController controller;

  const PersonalNoteField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomLabeledTextField(
      label: 'Kişisel Not Ekle',
      controller: controller,
      maxLines: 3,
      prefixWidget: Icon(Icons.visibility_off, size: 16.sp),
    );
  }
}
