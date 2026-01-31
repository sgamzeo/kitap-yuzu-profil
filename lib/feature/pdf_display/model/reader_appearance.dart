import 'dart:ui';

enum ReaderScrollMode { vertical, horizontal, single }

class ReaderAppearance {
  final Color backgroundColor;
  final double zoomLevel;
  final ReaderScrollMode scrollMode;

  const ReaderAppearance({
    required this.backgroundColor,
    required this.zoomLevel,
    required this.scrollMode,
  });

  ReaderAppearance copyWith({
    Color? backgroundColor,
    double? zoomLevel,
    ReaderScrollMode? scrollMode,
  }) {
    return ReaderAppearance(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      zoomLevel: zoomLevel ?? this.zoomLevel,
      scrollMode: scrollMode ?? this.scrollMode,
    );
  }
}
