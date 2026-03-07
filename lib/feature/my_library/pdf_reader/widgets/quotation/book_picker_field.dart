import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_labeled_text_field.dart';

class BookPickerField extends StatelessWidget {
  final TextEditingController controller;

  const BookPickerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomLabeledTextField(
      label: 'Hangi Kitap',
      controller: controller,
      maxLength: 50,
      isRequired: true,
    );
  }
}
