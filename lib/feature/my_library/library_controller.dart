import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/mock/library_mock.dart';
import 'package:kitap_yuzu_profil/feature/my_library/models/book_model.dart';

class LibraryController extends GetxController {
  final books = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    books.assignAll(mockLibrary);
  }

  void toggleSaved(String id) {
    final index = books.indexWhere((b) => b.id == id);
    if (index != -1) {
      books[index] = books[index].copyWith(isSaved: !books[index].isSaved);
    }
  }
}
