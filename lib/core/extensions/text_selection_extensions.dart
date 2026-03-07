import 'package:flutter/material.dart';

extension TextSelectionExtensions on TextSelection {
  /// Returns true if the selection is valid (not null and not collapsed)
  bool get isValid => !isCollapsed;

  /// Returns true if the selection is invalid (null or collapsed)
  bool get isInvalid => isCollapsed;

  /// Gets the selected text from a source string
  String getTextFrom(String source) {
    if (isCollapsed || start < 0 || end > source.length) {
      return '';
    }
    return source.substring(start, end);
  }

  /// Returns the length of the selection
  int get length => end - start;
}
