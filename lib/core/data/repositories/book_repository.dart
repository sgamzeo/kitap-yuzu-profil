import 'package:kitap_yuzu_profil/feature/my_library/models/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getMyBooks();
  Future<List<Book>> getMyLists();
  Future<Book?> getBookById(String id);
  Future<void> addBook(Book book);
  Future<void> updateBook(Book book);
  Future<void> deleteBook(String id);
}
