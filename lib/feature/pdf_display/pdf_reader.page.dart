import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pdf_reader_controller.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderPage extends StatelessWidget {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PdfReaderController c = Get.find<PdfReaderController>();

    return Scaffold(
      appBar: AppBar(title: const Text('PDF')),
      body: Stack(
        children: [
          SfPdfViewer.asset(
            'assets/pdfs/426122.pdf',
            controller: c.pdfController,
            onTextSelectionChanged: c.onTextSelectionChanged,
            onPageChanged: c.onPageChanged,
            onZoomLevelChanged: c.onZoomChanged,
          ),

          Obx(() {
            if (!c.hasSelection.value) {
              return const SizedBox.shrink();
            }

            return Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _HighlightMenu(c),
            );
          }),
        ],
      ),
    );
  }
}

class _HighlightMenu extends StatelessWidget {
  final PdfReaderController c;
  const _HighlightMenu(this.c);

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
            onPressed: c.sendToQuotePage,
          ),

          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: c.copySelectedText,
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: c.clearSelection,
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return GestureDetector(
      onTap: () => c.changeColor(color),
      child: CircleAvatar(radius: 10, backgroundColor: color),
    );
  }
}

// class AddQuotationView extends StatelessWidget {
//   const AddQuotationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<QuoteController>();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Alıntılar')),
//       body: Obx(() {
//         if (controller.quotes.isEmpty) {
//           return const Center(child: Text('Henüz alıntı yok'));
//         }

//         return ListView.builder(
//           itemCount: controller.quotes.length,
//           itemBuilder: (_, i) {
//             final q = controller.quotes[i];

//             return Container(
//               margin: const EdgeInsets.all(12),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: q.color.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(q.text, style: const TextStyle(fontSize: 16)),
//                   const SizedBox(height: 12),
//                   Text(
//                     q.source,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
