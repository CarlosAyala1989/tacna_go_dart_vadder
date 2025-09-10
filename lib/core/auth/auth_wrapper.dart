import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../features/auth/data/services/auth_service.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // Mostrar pantalla de carga mientras se verifica la autenticación
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Si el usuario está autenticado, mostrar la página principal
        if (snapshot.hasData && snapshot.data != null) {
          return const HomePage();
        }

        // Si no está autenticado, mostrar la página de autenticación
        return const AuthPage();
      },
    );
  }
}
