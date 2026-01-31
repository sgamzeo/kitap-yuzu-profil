import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.reader);
              },
              child: const Text('Asset PDF Aç'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myLibrary);
              },
              child: const Text('Library'),
            ),
          ],
        ),
      ),
    );
  }
}
