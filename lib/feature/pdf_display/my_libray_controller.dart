import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/model/imported_pdf.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/pdf_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class MyLibraryController extends GetxController {
  final importedPdfs = <ImportedPdf>[].obs;
  final jumpToListsTab = false.obs;

  @override
  void onInit() {
    super.onInit();

    importedPdfs.assignAll(PdfStorage.load());

    _ensureDefaultAssetPdf();
  }

  void _ensureDefaultAssetPdf() {
    final exists = importedPdfs.any((e) => e.path == 'assets/pdfs/426122.pdf');

    if (exists) return;

    final assetPdf = ImportedPdf(
      id: 'asset-426122',
      name: '426122',
      path: 'assets/pdfs/426122.pdf',
      importedAt: DateTime.now(),
      isAsset: true,
    );

    importedPdfs.insert(0, assetPdf);
    PdfStorage.save(importedPdfs);
  }

  Future<void> importPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null) return;

    final originalPath = result.files.single.path!;
    final fileName = result.files.single.name;

    final dir = await getApplicationDocumentsDirectory();
    final pdfDir = Directory('${dir.path}/imported_pdfs');

    if (!await pdfDir.exists()) {
      await pdfDir.create(recursive: true);
    }

    final safeName = '${DateTime.now().millisecondsSinceEpoch}_$fileName';

    final savedFile = File('${pdfDir.path}/$safeName');
    await File(originalPath).copy(savedFile.path);

    final pdf = ImportedPdf(
      id: const Uuid().v4(),
      name: fileName,
      path: savedFile.path,
      importedAt: DateTime.now(),
      isAsset: false,
    );

    importedPdfs.add(pdf);
    PdfStorage.save(importedPdfs);

    jumpToListsTab.value = true;
  }
}
