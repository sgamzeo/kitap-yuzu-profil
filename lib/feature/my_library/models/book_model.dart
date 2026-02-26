class Book {
  final String id;
  final String title;
  final String image;
  final double progress;
  final bool isSaved;

  const Book({
    required this.id,
    required this.title,
    required this.image,
    this.progress = 0.0,
    this.isSaved = false,
  });

  Book copyWith({
    String? id,
    String? title,
    String? image,
    double? progress,
    bool? isSaved,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      progress: progress ?? this.progress,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
