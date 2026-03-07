import 'package:get_storage/get_storage.dart';
import 'package:kitap_yuzu_profil/core/constants/app_storage_keys.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/models/pdf_file.dart';

class PdfStorage {
  static final _box = GetStorage();

  static List<ImportedPdf> load() {
    final raw = _box.read<List>(AppStorageKeys.importedPdfs);
    if (raw == null) return [];

    return raw
        .map((e) => ImportedPdf.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static void save(List<ImportedPdf> list) {
    _box.write(
      AppStorageKeys.importedPdfs,
      list.map((e) => e.toJson()).toList(),
    );
  }

  static void clear() {
    _box.remove(AppStorageKeys.importedPdfs);
  }
}
