import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';

class PdfSelectorPage extends StatelessWidget {
  const PdfSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Test')),
      body: Center(
        child: Column(
          children: [
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myLibrary);
              },
              text: 'Library',
            ),
          ],
        ),
      ),
    );
  }
}
