import 'package:flutter/material.dart';

enum ReaderScrollMode { vertical, horizontal, page }

class ReaderAppearance {
  final Color backgroundColor;
  final ReaderScrollMode scrollMode;
  final double zoomLevel;

  const ReaderAppearance({
    required this.backgroundColor,
    required this.scrollMode,
    required this.zoomLevel,
  });

  ReaderAppearance copyWith({
    Color? backgroundColor,
    ReaderScrollMode? scrollMode,
    double? zoomLevel,
  }) {
    return ReaderAppearance(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      scrollMode: scrollMode ?? this.scrollMode,
      zoomLevel: zoomLevel ?? this.zoomLevel,
    );
  }

  // 🔽 EKLENEN KISIM (STORAGE İÇİN)
  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': backgroundColor.value,
      'scrollMode': scrollMode.index,
      'zoomLevel': zoomLevel,
    };
  }

  factory ReaderAppearance.fromJson(Map<String, dynamic> json) {
    return ReaderAppearance(
      backgroundColor: Color(json['backgroundColor']),
      scrollMode: ReaderScrollMode.values[json['scrollMode']],
      zoomLevel: (json['zoomLevel'] as num).toDouble(),
    );
  }
}
