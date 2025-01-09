import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';

final class CalloutTheme {
  static TextStyle get titleStyle => GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.base.white,
  );

  static TextStyle get descriptionStyle => GoogleFonts.notoSans(
    fontSize: 14,
    color: AppColors.base.white.withValues(alpha: 0.9),
  );
}
