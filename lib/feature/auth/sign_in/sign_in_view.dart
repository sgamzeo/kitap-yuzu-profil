import 'package:flutter/material.dart';

import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/auth/auth_base_view.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/auth/widgets/%20auth_header_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(bottom: _buildBottom(), child: _buildbody());
  }

  Column _buildbody() {
    return Column(
      children: [
        const AuthHeader(title: 'Giriş Yap'),
        const SizedBox(height: 40),
        const CustomTextField(label: 'E-mail ya da kullanıcı adı'),
        SizedBox(height: AppDimens.l),
        const CustomTextField(
          label: 'Şifre',
          hintText: '*****',
          obscureText: true,
        ),
        SizedBox(height: AppDimens.xl),

        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            onPressed: () => Get.toNamed(AppRoutes.forgotPassword),

            text: 'Şifremi Unuttum',
          ),
        ),
      ],
    );
  }

  CustomButton _buildBottom() {
    return CustomButton(
      text: 'Giriş Yap',
      onPressed: () {
        Get.offNamed(AppRoutes.myLibrary);
      },
    );
  }
}
