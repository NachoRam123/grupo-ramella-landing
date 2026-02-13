import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryDark = Color.fromARGB(255, 15, 74, 71);
  static const Color secondaryGreen = Color.fromARGB(255, 107, 191, 89);
  static const Color accentGreen1 = Color.fromARGB(255, 138, 209, 118);
  static const Color accentGreen2 = Color.fromARGB(255, 164, 225, 130);
  static const Color background = Color.fromARGB(255, 247, 243, 238);
}

class AppTextStyles {
  static TextStyle get navLink => GoogleFonts.montserrat(
    color: AppColors.primaryDark,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle get sectionTitle => GoogleFonts.montserrat(
    color: AppColors.primaryDark,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static TextStyle get bodyText => GoogleFonts.montserrat(
    color: AppColors.primaryDark,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.5,
  );

  static TextStyle get heroTitle => GoogleFonts.montserrat(
    color: AppColors.primaryDark,
    fontWeight: FontWeight.bold,
    fontSize: 48,
  );
}
