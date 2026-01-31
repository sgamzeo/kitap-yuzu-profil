import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_reader_controller.dart';
import '../model/reader_appearance.dart';

class ReaderAppearanceBottomSheet extends GetView<PdfReaderController> {
  const ReaderAppearanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Handle(),
            const SizedBox(height: 12),

            _Title(),
            const SizedBox(height: 20),

            _Card(title: 'Arka Plan', child: _BackgroundChips()),
            const SizedBox(height: 16),

            _Card(title: 'Kaydırma', child: _ScrollModeSegment()),
            const SizedBox(height: 16),

            _Card(title: 'Yakınlaştırma', child: _ZoomSlider()),
            const SizedBox(height: 24),

            _SaveButton(),
          ],
        ),
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Okuma Görünümü',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final Widget child;

  const _Card({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _BackgroundChips extends StatelessWidget {
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(color: Colors.black, width: 2)
                  : null,
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: const Text('Aa', style: TextStyle(fontSize: 12)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ScrollModeSegment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    return Row(
      children: ReaderScrollMode.values.map((mode) {
        final selected = c.appearance.value.scrollMode == mode;

        return Expanded(
          child: GestureDetector(
            onTap: () => c.changeScrollMode(mode),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: selected ? Colors.black : Colors.transparent,
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                mode == ReaderScrollMode.vertical
                    ? Icons.view_agenda
                    : Icons.view_carousel,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ZoomSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<PdfReaderController>();

    return Row(
      children: [
        const Icon(Icons.zoom_out),
        Expanded(
          child: Slider(
            min: 1.0,
            max: 3.0,
            value: c.appearance.value.zoomLevel,
            onChanged: c.setZoom,
          ),
        ),
        const Icon(Icons.zoom_in),
      ],
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
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          c.saveAppearance();
          Get.back();
        },
        child: const Text('Kaydet'),
      ),
    );
  }
}
