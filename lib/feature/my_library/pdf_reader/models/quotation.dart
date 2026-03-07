import 'dart:ui';

class Quote {
  final String id;
  final String text;
  final Color color;
  final DateTime createdAt;
  final String source;

  Quote({
    required this.id,
    required this.text,
    required this.color,
    required this.createdAt,
    required this.source,
  });
}
