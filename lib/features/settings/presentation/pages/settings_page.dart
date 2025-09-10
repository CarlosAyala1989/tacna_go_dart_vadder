import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../auth/data/services/auth_service.dart';
import '../../../auth/presentation/pages/auth_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumimos el ThemeProvider para el switch
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authService = AuthService();

    return Scaffold(
      backgroundColor: AppColors.getBackground(context),
      appBar: AppBar(
        title: Text('Configuración', style: TextStyles.getHeading3(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- Sección de Apariencia ---
          ListTile(
            title: const Text('Modo Oscuro'),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                // Usamos 'listen: false' dentro de un callback
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme(value);
              },
            ),
          ),
          const Divider(),

          // --- Sección de Cuenta (Condicional) ---
          const SizedBox(height: 24),
          // Usamos un StreamBuilder para reaccionar en tiempo real a los cambios de auth
          StreamBuilder<User?>(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final user = snapshot.data;
              // Si el usuario es anónimo o no ha iniciado sesión
              if (user == null) {
                return _buildGuestActions(context);
              } else {
                // Si es un usuario registrado
                return _buildLoggedInActions(context, authService);
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget para usuarios logueados
  Widget _buildLoggedInActions(BuildContext context, AuthService authService) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            await authService.signOut();
            // El AuthWrapper se encargará de redirigir a la pantalla de login
            if (context.mounted) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
          child: const Text('Cerrar Sesión'),
        ),
      ],
    );
  }

  // Widget para invitados (anónimos)
  Widget _buildGuestActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Crea una cuenta para guardar tus lugares favoritos y más.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Navegamos a la página de login
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthPage()),
            );
          },
          child: const Text('Registrarse o Iniciar Sesión'),
        ),
      ],
    );
  }
}
