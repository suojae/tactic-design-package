import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTypography {
  static const heading = _HeadingTypography();
  static const paragraph = _ParagraphTypography();
}

final class _HeadingTypography {
  const _HeadingTypography();

  TextStyle get h0 => GoogleFonts.notoSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h1 => GoogleFonts.notoSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h2 => GoogleFonts.notoSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h3 => GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h4 => GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h5 => GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h6 => GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  TextStyle get h7 => GoogleFonts.notoSans(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
}

final class _ParagraphTypography {
  const _ParagraphTypography();

  TextStyle get p0 => GoogleFonts.notoSans(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p1 => GoogleFonts.notoSans(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p2 => GoogleFonts.notoSans(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p3 => GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p4 => GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p5 => GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p6 => GoogleFonts.notoSans(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  TextStyle get p7 => GoogleFonts.notoSans(
    fontSize: 8,
    fontWeight: FontWeight.normal,
  );
}
