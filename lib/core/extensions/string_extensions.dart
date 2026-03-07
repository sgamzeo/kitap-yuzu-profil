extension StringExtensions on String {
  /// Returns true if the string is not empty
  bool get isNotEmpty => this.isNotEmpty;

  /// Returns true if the string is empty or null
  bool get isNullOrEmpty => isEmpty;

  /// Safely gets a substring, returns empty string if out of bounds
  String safeSubstring(int start, [int? end]) {
    if (start < 0 || start >= length) return '';
    final actualEnd = end ?? length;
    if (actualEnd > length) return substring(start);
    return substring(start, actualEnd);
  }

  /// Truncates string to maxLength with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }
}
