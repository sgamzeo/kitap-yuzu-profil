import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            Center(
              child: Column(
                children: const [
                  Text(
                    'Kitap Yüzü',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text('Mail ya da kullanıcı adı'),
            const SizedBox(height: 6),
            CustomTextField(hintText: ''),

            const SizedBox(height: 20),

            const Text('Şifre'),
            const SizedBox(height: 6),
            CustomTextField(hintText: '******', obscureText: true),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.resetPassword);
                },
                child: const Text(
                  'Şifremi Unuttum',
                  style: TextStyle(fontSize: 12, color: AppColors.primary),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: CustomButton(onPressed: () {}, text: 'Giriş Yap'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
