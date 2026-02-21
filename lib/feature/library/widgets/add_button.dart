import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/my_libray_controller.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyLibraryController>();

    return FloatingActionButton(
      onPressed: controller.importPdf,
      child: const Icon(Icons.add),
    );
  }
}
