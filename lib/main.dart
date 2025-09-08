// En tu main.dart
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart'; // Importa la nueva página

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tacna App',
      theme: AppTheme.theme, // Aplicamos nuestro tema global
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
