class ImportedPdf {
  final String id;
  final String name;
  final String path;
  final DateTime importedAt;
  final bool isAsset;

  ImportedPdf({
    required this.id,
    required this.name,
    required this.path,
    required this.importedAt,
    required this.isAsset,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'path': path,
    'importedAt': importedAt.toIso8601String(),
    'isAsset': isAsset,
  };

  factory ImportedPdf.fromJson(Map<String, dynamic> json) {
    return ImportedPdf(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      importedAt: DateTime.parse(json['importedAt']),
      isAsset: json['isAsset'] ?? false,
    );
  }
}
