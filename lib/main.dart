// Añade esta importación al inicio de tu archivo main.dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tacna App',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,

      // --- AÑADE ESTAS LÍNEAS ---
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''), // Español, sin código de país
        // Locale('en', ''), // Podríamos añadir inglés en el futuro
      ],

      // --- FIN DE LAS LÍNEAS AÑADIDAS ---
      home: const HomePage(),
    );
  }
}
