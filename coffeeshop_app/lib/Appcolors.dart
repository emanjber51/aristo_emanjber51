
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color pageBackground = Color(0xFFFDFBF9);

  static const Color surface = Color(0xFFFFFFFF);

  static const Color primary = Color(0xFF6F4E37);

  static const Color accent = Color(0xFFD9A066);

  static const Color textPrimary = Color(0xFF2B2118);

  static const Color textSecondary = Color(0xFF6F6156);

  static const Color chipUnselected = Color(0xFFF1EAE4);

  static const BoxShadow cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.06),
    blurRadius: 12,
    offset: Offset(0, 4),
  );
}