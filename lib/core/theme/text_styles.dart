import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static const String _fontFamily = 'PlusJakartaSans';

  // Estilos base (sin color, se obtiene del tema)
  static const TextStyle heading1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.015,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.015,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyLgMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.015,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.015,
  );

  // Métodos para obtener estilos con colores dinámicos
  static TextStyle getHeading1(BuildContext context) {
    return heading1.copyWith(color: AppColors.getTextPrimary(context));
  }

  static TextStyle getHeading2(BuildContext context) {
    return heading2.copyWith(color: AppColors.getTextPrimary(context));
  }

  static TextStyle getHeading3(BuildContext context) {
    return heading3.copyWith(color: AppColors.getTextPrimary(context));
  }

  static TextStyle getBodyLg(BuildContext context) {
    return bodyLg.copyWith(color: AppColors.getTextPrimary(context));
  }

  static TextStyle getBodyLgMedium(BuildContext context) {
    return bodyLgMedium.copyWith(color: AppColors.getTextPrimary(context));
  }

  static TextStyle getBodySm(BuildContext context) {
    return bodySm.copyWith(color: AppColors.getTextSecondary(context));
  }

  static TextStyle getCaption(BuildContext context) {
    return caption.copyWith(color: AppColors.getTextSecondary(context));
  }
}
