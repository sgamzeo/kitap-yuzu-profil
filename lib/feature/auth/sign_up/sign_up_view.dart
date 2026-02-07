import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

import 'package:kitap_yuzu_profil/feature/auth/auth_base_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/widgets/%20auth_header_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottom: CustomButton(text: 'Kayıt Ol', onPressed: () {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AuthHeader(title: 'Kayıt Ol'),
          const SizedBox(height: 40),

          const SizedBox(height: 6),
          const CustomTextField(label: "Mail ya da kullanıcı adı"),

          const SizedBox(height: 20),

          const CustomTextField(label: "Şifre", obscureText: true),

          const SizedBox(height: 16),

          _AgreeTermsAndConditions(context),
        ],
      ),
    );
  }
}

Widget _AgreeTermsAndConditions(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
        value: false,
        onChanged: (_) {},
        shape: const CircleBorder(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
      Expanded(
        child: AutoSizeText.rich(
          TextSpan(
            style: Theme.of(
              context,
            ).textTheme.osSmall.copyWith(color: AppColors.tertiary),
            children: [
              TextSpan(
                text: 'Kullanım Şartları',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = _showTermsSheet,
              ),
              const TextSpan(text: ' ve '),
              TextSpan(
                text: 'Gizlilik Sözleşmesini',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = _showPrivacySheet,
              ),
              const TextSpan(text: ' okudum.'),
            ],
          ),
          maxLines: 1,
          minFontSize: 9,
          overflow: TextOverflow.visible,
        ),
      ),
    ],
  );
}

void _showTermsSheet() {
  Get.bottomSheet(
    const _TermsBottomSheet(title: 'Kullanım Şartları'),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

void _showPrivacySheet() {
  Get.bottomSheet(
    const _TermsBottomSheet(title: 'Gizlilik Sözleşmesi'),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

class _TermsBottomSheet extends StatelessWidget {
  final String title;
  const _TermsBottomSheet({required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButton(onPressed: Get.back, text: 'Kapat'),
            ),
          ],
        ),
      ),
    );
  }
}
