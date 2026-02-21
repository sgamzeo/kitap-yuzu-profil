import 'package:flutter/material.dart';

class LibraryFilterRow extends StatelessWidget {
  const LibraryFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          OutlinedButton.icon(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0xFF8A8A8A)),
            ),
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Sırala'),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0xFF8A8A8A)),
            ),
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('Ara'),
          ),
        ],
      ),
    );
  }
}
