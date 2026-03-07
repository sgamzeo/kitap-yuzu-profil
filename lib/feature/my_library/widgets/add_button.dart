import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/library_controller.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PdfReaderController>();

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _MenuItem(
                      icon: Icons.picture_as_pdf,
                      title: "PDF İçe Aktar",
                      onTap: () {
                        Get.back();
                        // controller.importPdf();
                      },
                    ),
                    _MenuItem(
                      icon: Icons.list_alt,
                      title: "Yeni Liste Oluştur",
                      onTap: () {
                        Get.back();
                        Get.to(() => const AddBookList());
                      },
                    ),
                    _MenuItem(
                      icon: Icons.science,
                      title: "Custom PDF Text Test (Asset)",
                      onTap: () {
                        Get.back();

                        Get.toNamed(
                          AppRoutes.pdfTextTest,
                          arguments: {
                            'pdfPath': 'assets/pdfs/426122.pdf',
                            'isAsset': true,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: Icon(icon, color: const Color(0xFF3F5D50)),
      title: Text(
        title,
        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}

class AddBookList extends StatefulWidget {
  const AddBookList({super.key});

  @override
  State<AddBookList> createState() => _AddBookListState();
}

class _AddBookListState extends State<AddBookList> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  bool isPrivate = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Liste Oluştur',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: AppDimens.m),

            /// Liste Adı
            _LabelWithCounter(
              label: 'Liste Adı *',
              count: titleController.text.length,
              max: 50,
            ),

            const SizedBox(height: 6),

            _CustomTextField(
              controller: titleController,
              maxLength: 50,
              maxLines: 1,
            ),

            const SizedBox(height: 20),

            _LabelWithCounter(
              label: 'Liste Açıklaması',
              count: descController.text.length,
              max: 250,
            ),

            const SizedBox(height: 6),

            _CustomTextField(
              controller: descController,
              maxLength: 250,
              maxLines: 4,
            ),

            SizedBox(height: AppDimens.l),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gizlilik Ayarı',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: isPrivate,
                  onChanged: (value) {
                    setState(() {
                      isPrivate = value;
                    });
                  },
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Liste herkes tarafından görüntülenebilir',
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F5D50),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Oluştur',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: AppDimens.l),
          ],
        ),
      ),
    );
  }
}

class _LabelWithCounter extends StatelessWidget {
  final String label;
  final int count;
  final int max;

  const _LabelWithCounter({
    required this.label,
    required this.count,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          '$count/$max',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    required this.maxLength,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
