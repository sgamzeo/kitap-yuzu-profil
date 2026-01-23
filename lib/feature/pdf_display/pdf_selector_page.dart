import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfSelectorPage extends StatelessWidget {
  const PdfSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // sadece reader'a git
            Get.toNamed('/reader');
          },
          child: const Text('Asset PDF Aç'),
        ),
      ),
    );
  }
}
