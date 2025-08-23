import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the visual styling for the application.
///
/// The [AppTheme] class centralizes color, typography and other
/// appearance-related properties to ensure a consistent look and feel
/// throughout the app.  It uses the [GoogleFonts] package to apply
/// the Arya typeface for headings (including the AppBar) and the
/// Inter typeface for body text.  Adjustments can be made here
/// without touching individual widgets.
class AppTheme {
  /// Generates a light [ThemeData] instance customized for this app.
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF000000),
        secondary: Color(0xFF757575),
      ),
      textTheme: TextTheme(
        // Large headlines use Arya for the app title and section headers.
        headlineLarge: GoogleFonts.arya(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        // Medium and body text use Inter for easy reading.
        titleMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.arya(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 8,
      ),
    );
  }
}