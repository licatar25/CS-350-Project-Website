import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';

class AppThemeData {
  static final ColorScheme _lightColorScheme = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primary: const Color(0xFFF3956F),
    primaryKey: Color(0xFFDA6237),
    secondaryKey: Color(0xFFBB3838),
    tones: FlexTones.vivid(Brightness.light),
  );

  static final ColorScheme _darkColorScheme = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primary: Color(0xFFda6237),
    primaryKey: Color(0xFFda6237),
    secondaryKey: Color.fromARGB(255, 187, 56, 56),
    tones: FlexTones.vivid(Brightness.dark),
  );

  static ThemeData lightThemeData = themeData(_lightColorScheme);
  static ThemeData darkThemeData = themeData(_darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        titleTextStyle: _textTheme.headlineLarge,
        centerTitle: true,
        color: colorScheme.primary,
      ),
    );
  }

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 20.0),
    headlineLarge:
        GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 56.0),
    headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 42.0),
    headlineSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 24.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 24.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 20.0),
    bodySmall: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 16.0),
    titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 32.0),
    titleMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 24.0),
    titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 22.0),
  );
}
