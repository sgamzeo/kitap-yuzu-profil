extension ListExtensions<T> on List<T> {
  /// Returns true if the list is not empty
  bool get isNotEmpty => this.isNotEmpty;

  /// Safely gets an element at index, returns null if out of bounds
  T? getOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Returns true if the index is valid for this list
  bool isValidIndex(int index) => index >= 0 && index < length;

  /// Returns the last element or null if empty
  T? get lastOrNull => isEmpty ? null : last;

  /// Returns the first element or null if empty
  T? get firstOrNull => isEmpty ? null : first;
}
