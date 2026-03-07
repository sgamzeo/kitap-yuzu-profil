import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_labeled_text_field.dart';

class QuoteInputField extends StatelessWidget {
  final TextEditingController controller;

  const QuoteInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomLabeledTextField(
      label: 'Alıntı',
      controller: controller,
      maxLines: 4,
      maxLength: 100,
      isRequired: true,
    );
  }
}
