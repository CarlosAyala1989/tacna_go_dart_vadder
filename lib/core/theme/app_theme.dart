import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'PlusJakartaSans',

      // Configuración del AppBarTheme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyles.heading3,
      ),

      // Configuración de TextTheme
      textTheme: const TextTheme(
        displayLarge: TextStyles.heading1,
        headlineMedium: TextStyles.heading2,
        titleLarge: TextStyles.heading3,
        bodyLarge: TextStyles.bodyLg,
        bodyMedium: TextStyles.bodySm,
        labelLarge: TextStyles.button,
      ),

      // Configuración de ElevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: TextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // fully rounded
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(84, 40),
        ),
      ),

      // Configuración de OutlinedButtonTheme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          textStyle: TextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(84, 40),
        ),
      ),

      // Configuración para el TextFormField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: TextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      fontFamily: 'PlusJakartaSans',

      // Configuración del AppBarTheme para modo oscuro
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
        titleTextStyle: TextStyles.heading3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
      ),

      // Configuración de TextTheme para modo oscuro
      textTheme: TextTheme(
        displayLarge: TextStyles.heading1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: TextStyles.heading2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleLarge: TextStyles.heading3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: TextStyles.bodyLg.copyWith(color: AppColors.darkTextPrimary),
        bodyMedium: TextStyles.bodySm.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: TextStyles.button,
      ),

      // Configuración de ElevatedButtonTheme para modo oscuro
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: TextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(84, 40),
        ),
      ),

      // Configuración de OutlinedButtonTheme para modo oscuro
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.darkSurface,
          foregroundColor: AppColors.darkTextPrimary,
          textStyle: TextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size(84, 40),
        ),
      ),

      // Configuración para el TextFormField en modo oscuro
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: TextStyles.bodyLg.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
