import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';

class HighlightMenu extends GetView<PdfReaderController> {
  const HighlightMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.black.withOpacity(0.85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _dot(Colors.yellow),
          _dot(Colors.green),
          _dot(Colors.pink),
          IconButton(
            icon: const Icon(Icons.format_quote, color: Colors.white),
            onPressed: controller.sendToQuotePage,
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: controller.copySelectedText,
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: controller.clearSelection,
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return GestureDetector(
      onTap: () => controller.addHighlight(color),
      child: CircleAvatar(radius: 10, backgroundColor: color),
    );
  }
}
