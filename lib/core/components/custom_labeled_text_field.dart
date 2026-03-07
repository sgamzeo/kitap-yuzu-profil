import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class CustomLabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final int maxLines;
  final String? counterText;
  final bool isRequired;
  final Widget? prefixWidget;

  const CustomLabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLength,
    this.maxLines = 1,
    this.counterText,
    this.isRequired = false,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(isRequired ? '$label *' : label),
            if (prefixWidget != null) ...[
              SizedBox(width: AppDimens.fieldSpacing),
              prefixWidget!,
            ],
          ],
        ),
        SizedBox(height: AppDimens.fieldSpacing),
        TextField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText:
                counterText ?? (maxLength != null ? '0/$maxLength' : null),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.textFieldRadius),
            ),
          ),
        ),
      ],
    );
  }
}
