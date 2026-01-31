import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import '../model/reader_appearance.dart';

class ReaderAppearanceBottomSheet extends StatelessWidget {
  const ReaderAppearanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            const SizedBox(height: 20),

            _SectionTitle('Arka Plan'),
            _BackgroundSelector(),

            const SizedBox(height: 16),
            _SectionTitle('Kaydırma'),
            _ScrollModeSelector(),

            const SizedBox(height: 16),
            _SectionTitle('Yakınlaştırma'),
            Slider(
              min: 1.0,
              max: 3.0,
              value: c.appearance.value.zoomLevel,
              onChanged: c.setZoom,
            ),

            const SizedBox(height: 24),
            _SaveButton(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleSmall);
  }
}

class _Dropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const _Dropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

class _BackgroundSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    final colors = [
      Colors.white,
      const Color(0xFFF4F1EC),
      const Color(0xFFEDE7D9),
      const Color(0xFFEAF2FF),
    ];

    return Row(
      children: colors.map((color) {
        final selected =
            c.appearance.value.backgroundColor.value == color.value;

        return GestureDetector(
          onTap: () => c.changeBackground(color),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(color: Colors.black, width: 2)
                  : null,
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: color,
              child: const Text('Aa', style: TextStyle(fontSize: 12)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ScrollModeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ReaderScrollMode.values.map((mode) {
        final selected = c.appearance.value.scrollMode == mode;

        return GestureDetector(
          onTap: () => c.changeScrollMode(mode),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: selected ? Colors.black : Colors.grey),
            ),
            child: Icon(
              mode == ReaderScrollMode.vertical
                  ? Icons.view_agenda
                  : mode == ReaderScrollMode.horizontal
                  ? Icons.view_carousel
                  : Icons.menu_book,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          c.saveAppearance();
          Get.back();
        },
        child: const Text('Kaydet'),
      ),
    );
  }
}
