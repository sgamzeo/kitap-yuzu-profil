import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/auth/auth_base_view.dart';
import 'package:kitap_yuzu_profil/feature/auth/widgets/%20auth_header_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottom: CustomButton(
        text: 'Bağlantı Gönder',
        onPressed: () {
          Get.toNamed(AppRoutes.resetPassword);
        },
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(title: 'Şifremi Unuttum'),
          const SizedBox(height: 44),

          const CustomTextField(label: 'E-posta'),
          SizedBox(height: AppDimens.xs),
          Text(
            'E-posta adresinize şifre sıfırlama maili gönderilecektir',
            style: Theme.of(
              context,
            ).textTheme.osS2.copyWith(color: AppColors.tertiary),
          ),
        ],
      ),
    );
  }
}
