# Basit Kullanım - Repository Pattern

## 1. Binding'de Repository Seç

```dart
class MyLibraryBinding extends Bindings {
  @override
  void dependencies() {
    // Mock mu API mi?
    if (AppConfig.useMockData) {
      Get.lazyPut<BookRepository>(() => MockBookDatasource());
    } else {
      Get.lazyPut<BookRepository>(() => BookApiDatasource());
    }
    
    // Controller'a inject et
    Get.lazyPut<LibraryController>(() => LibraryController(Get.find()));
  }
}
```

## 2. Controller'da Kullan

```dart
class LibraryController extends GetxController {
  final BookRepository repository;
  
  LibraryController(this.repository); // GetX otomatik inject eder
  
  final books = <Book>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }
  
  Future<void> loadBooks() async {
    books.value = await repository.getMyBooks();
  }
}
```

## 3. API'ye Geç

`lib/core/config/app_config.dart`:
```dart
static const bool useMockData = false; // Sadece bunu değiştir!
```

Hepsi bu kadar! Factory, Provider falan yok. Sadece GetX.
