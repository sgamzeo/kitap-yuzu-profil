# Repository Pattern Kullanım Kılavuzu

## Controller'da Kullanım

```dart
class LibraryController extends GetxController {
  final BookRepository _bookRepository;
  
  LibraryController(this._bookRepository);
  
  final books = <Book>[].obs;
  final isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }
  
  Future<void> loadBooks() async {
    try {
      isLoading.value = true;
      books.value = await _bookRepository.getMyBooks();
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }
}
```

## Binding'de Kullanım

```dart
class MyLibraryBinding extends Bindings {
  @override
  void dependencies() {
    // Repository'yi inject et
    Get.lazyPut<BookRepository>(() => BookRepositoryProvider.getRepository());
    
    // Controller'a repository'yi geç
    Get.lazyPut<LibraryController>(
      () => LibraryController(Get.find<BookRepository>())
    );
  }
}
```

## API'ye Geçiş

1. `lib/core/config/app_config.dart` dosyasında:
   ```dart
   static const bool useMockData = false; // true -> false
   ```

2. `book_api_datasource.dart` içindeki TODO'ları doldur

3. Dio veya başka HTTP client'ı binding'e ekle:
   ```dart
   Get.put<Dio>(Dio(BaseOptions(
     baseUrl: AppConfig.apiBaseUrl,
     connectTimeout: Duration(milliseconds: AppConfig.apiTimeout),
   )));
   ```

## Avantajlar

- ✅ Mock data ile hızlı development
- ✅ API hazır olunca tek flag değişikliği
- ✅ Test edilebilir kod
- ✅ Dependency injection
- ✅ Tek sorumluluk prensibi
