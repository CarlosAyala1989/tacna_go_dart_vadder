import 'package:flutter/material.dart';

// Paleta de colores principal (tema cálido/rojizo)
class AppColors {
  static const Color primary = Color(0xFFF7473B);
  static const Color background = Color(0xFFFCF8F8);
  static const Color surface = Color(
    0xFFF4E7E7,
  ); // Fondo para inputs, botones secundarios
  static const Color textPrimary = Color(0xFF1C0E0D);
  static const Color textSecondary = Color(0xFF9D4E48);
  static const Color white = Color(0xFFFFFFFF);
  static const Color dragHandle = Color(0xFFE9D0CE);

  // Colores de la paleta alternativa (tema verdoso) por si se necesita
  static const Color backgroundGreen = Color(0xFFF9FBFB);
  static const Color textPrimaryGreen = Color(0xFF121717);
  static const Color textSecondaryGreen = Color(0xFF638383);
  static const Color surfaceGreen = Color(0xFFEBF0F0);

  // Colores para tema oscuro
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkDragHandle = Color(0xFF2C2C2C);

  // Métodos para obtener colores dinámicos según el tema
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : background;
  }

  static Color getSurface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurface
        : surface;
  }

  static Color getTextPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextPrimary
        : textPrimary;
  }

  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : textSecondary;
  }

  static Color getDragHandle(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkDragHandle
        : dragHandle;
  }
}
