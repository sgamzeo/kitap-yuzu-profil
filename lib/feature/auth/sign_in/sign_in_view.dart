import 'package:flutter/material.dart';

import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';
import 'package:kitap_yuzu_profil/feature/auth/auth_base_view.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/auth/widgets/%20auth_header_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottom: CustomButton(text: 'Giriş Yap', onPressed: () {}),
      child: Column(
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
            child: TextButton(
              onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Şifremi Unuttum',
                style: Theme.of(
                  context,
                ).textTheme.osSmall.copyWith(color: AppColors.tertiary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
