import 'package:kitap_yuzu_profil/core/data/repositories/book_repository.dart';
import 'package:kitap_yuzu_profil/feature/my_library/models/book_model.dart';
// import 'package:dio/dio.dart'; // API client eklenecek

class BookApiDatasource implements BookRepository {
  // final Dio _dio;

  // BookApiDatasource(this._dio);

  @override
  Future<List<Book>> getMyBooks() async {
    // TODO: API call
    // final response = await _dio.get('/api/books/my-books');
    // return (response.data as List).map((e) => Book.fromJson(e)).toList();
    throw UnimplementedError('API not implemented yet');
  }

  @override
  Future<List<Book>> getMyLists() async {
    // TODO: API call
    throw UnimplementedError('API not implemented yet');
  }

  @override
  Future<Book?> getBookById(String id) async {
    // TODO: API call
    throw UnimplementedError('API not implemented yet');
  }

  @override
  Future<void> addBook(Book book) async {
    // TODO: API call
    throw UnimplementedError('API not implemented yet');
  }

  @override
  Future<void> updateBook(Book book) async {
    // TODO: API call
    throw UnimplementedError('API not implemented yet');
  }

  @override
  Future<void> deleteBook(String id) async {
    // TODO: API call
    throw UnimplementedError('API not implemented yet');
  }
}
