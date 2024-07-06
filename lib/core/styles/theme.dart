
import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

ColorScheme getTheme(context) {
  return Theme.of(context).colorScheme;
}

ThemeData setTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: SystemColors.whiteColor,
        primary: SystemColors.bluePrimary,
        secondary: SystemColors.blueSecondary,
      ).copyWith(),
      useMaterial3: true,
      fontFamily: SystemFonts.paragraphFont,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: SystemColors.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headlineSmall: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontFamily: SystemFonts.titleFont,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelLarge: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        labelSmall: TextStyle(
          fontFamily: SystemFonts.paragraphFont,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
    );
}
