import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/components/custom_button.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';

class AddQuotationView extends StatelessWidget {
  const AddQuotationView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    final bookController = TextEditingController(
      text: args?['bookTitle'] ?? '',
    );

    final quoteController = TextEditingController(text: args?['quote'] ?? '');

    final noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Alıntı Oluştur'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.download), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.wireframe1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),

            _BookPicker(controller: bookController),
            const SizedBox(height: 20),

            _QuoteInput(controller: quoteController),
            const SizedBox(height: 20),

            _PersonalNote(controller: noteController),
            const SizedBox(height: 20),

            _CommunityShare(),
            const SizedBox(height: 30),

            _ShareButton(),
          ],
        ),
      ),
    );
  }
}

class _BookPicker extends StatelessWidget {
  final TextEditingController controller;
  const _BookPicker({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hangi Kitap *'),
              const SizedBox(height: 6),
              TextField(
                controller: controller,
                maxLength: 50,
                decoration: InputDecoration(
                  counterText: '0/50',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuoteInput extends StatelessWidget {
  final TextEditingController controller;
  const _QuoteInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alıntı *'),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: 4,
          maxLength: 100,
          decoration: InputDecoration(
            counterText: '0/100',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }
}

class _PersonalNote extends StatelessWidget {
  final TextEditingController controller;
  const _PersonalNote({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text('Kişisel Not Ekle'),
            SizedBox(width: 6),
            Icon(Icons.visibility_off, size: 16),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }
}

class _CommunityShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Toplulukta Paylaş'),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('"Topluluk ismi"'),
                    SizedBox(width: 6),
                    Icon(Icons.close, size: 14),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            CustomButton(
              onPressed: () {},
              text: 'Ekle',
              color: AppColors.wireframe3,
              radius: 5,
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Alıntı "Topluluk ismi" isimli toplulukta paylaşılacaktır',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class _ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: CustomButton(
        onPressed: () {},
        text: 'Paylaş',
        color: AppColors.wireframe3,
        radius: 10,
      ),
    );
  }
}
