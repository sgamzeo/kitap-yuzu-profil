import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/quotation_controller.dart';

class QuotationAppBar extends GetView<QuotationController>
    implements PreferredSizeWidget {
  const QuotationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('Alıntı Oluştur'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: controller.onDownload,
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: controller.onShare,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
