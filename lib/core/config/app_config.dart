class AppConfig {
  // API'ye geçiş için bu flag'i değiştir
  static const bool useMockData = true;

  // API base URL
  static const String apiBaseUrl = 'https://api.example.com';

  // Diğer config değerleri
  static const int apiTimeout = 30000; // ms
}
