import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_theme.dart';
import 'package:kitap_yuzu_profil/feature/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: ProfilePage(),
    );
  }
}
