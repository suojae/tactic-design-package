import 'package:flutter/material.dart';

final class AppColors {
  static const base = _BaseColors();
  static const primary = _PrimaryColors();
  static const secondary = _SecondaryColors();
  static const semantic = _SemanticColors();
  static const gradation = _GradationColors();
}

final class _BaseColors {
  const _BaseColors();

  final Color black = const Color(0xFF18181B);
  final Color deep = const Color(0xFF272727);
  final Color half = const Color(0xFF202020);
  final Color gray = const Color(0xFF71717A);
  final Color input = const Color(0xFFE4E4E7);
  final Color second = const Color(0xFFF4F4F5);
  final Color white = const Color(0xFFFFFFFF);
}

final class _PrimaryColors {
  const _PrimaryColors();

  final Color blue = const Color(0xFF0046A1);
  final Color sky = const Color(0xFF007BFF);
}

final class _SecondaryColors {
  const _SecondaryColors();

  final Color orange = const Color(0xFFFF8C00);
  final Color lemon = const Color(0xFFFFD700);
}

final class _SemanticColors {
  const _SemanticColors();

  final Color red = const Color(0xFFDC2626);
  final Color darkRed = const Color(0xFF8C1919);
}

final class _GradationColors {
  const _GradationColors();

  final Color gBlue = const Color(0xFF007BFF);
  final Color gOrange = const Color(0xFFFFD700);
}