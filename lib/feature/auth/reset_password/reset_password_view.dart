import 'package:flutter/material.dart';

import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/components/custom_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
                    'Şifremi mi Unuttun?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text('E-posta adresi'),
            const SizedBox(height: 6),
            const CustomTextField(),

            const SizedBox(height: 10),

            const Text(
              'E-posta adresinize şifre sıfırlama maili gönderilecektir',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {},
                text: 'Şifremi Sıfırla',
                radius: 14,
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
