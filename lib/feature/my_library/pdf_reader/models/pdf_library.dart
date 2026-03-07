class LibraryPdf {
  final String id;
  final String path;
  final String name;
  final DateTime addedAt;

  LibraryPdf({
    required this.id,
    required this.path,
    required this.name,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'name': name,
    'addedAt': addedAt.toIso8601String(),
  };

  factory LibraryPdf.fromJson(Map<String, dynamic> json) {
    return LibraryPdf(
      id: json['id'],
      path: json['path'],
      name: json['name'],
      addedAt: DateTime.parse(json['addedAt']),
    );
  }
}
