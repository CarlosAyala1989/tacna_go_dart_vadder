// Añade esta importación al inicio de tu archivo main.dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/auth/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_provider.dart';

void main() async {
  // <-- Convertir a async
  // Asegurarse de que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos al provider para aplicar el tema correcto
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Tacna App',
      theme: AppTheme.lightTheme, // Le decimos cuál es el tema claro
      darkTheme: AppTheme.darkTheme, // Le decimos cuál es el tema oscuro
      themeMode: themeProvider.themeMode, // El provider decide cuál mostrar
      debugShowCheckedModeBanner: false,
      // Configuración de localización para el calendario
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es', 'ES'), Locale('en', 'US')],
      locale: const Locale('es', 'ES'),
      home:
          const AuthWrapper(), // Usamos el AuthWrapper para manejar la autenticación
    );
  }
}
