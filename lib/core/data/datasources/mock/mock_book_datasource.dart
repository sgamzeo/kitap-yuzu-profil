import 'package:kitap_yuzu_profil/core/data/repositories/book_repository.dart';
import 'package:kitap_yuzu_profil/feature/my_library/models/book_model.dart';

class MockBookDatasource implements BookRepository {
  // Mock data burada
  final List<Book> _mockBooks = [
    // TODO: Mock dataları buraya taşı
  ];

  @override
  Future<List<Book>> getMyBooks() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network
    return _mockBooks;
  }

  @override
  Future<List<Book>> getMyLists() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockBooks;
  }

  @override
  Future<Book?> getBookById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockBooks.firstWhere((book) => book.id == id);
  }

  @override
  Future<void> addBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockBooks.add(book);
  }

  @override
  Future<void> updateBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _mockBooks.indexWhere((b) => b.id == book.id);
    if (index != -1) {
      _mockBooks[index] = book;
    }
  }

  @override
  Future<void> deleteBook(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockBooks.removeWhere((book) => book.id == id);
  }
}
