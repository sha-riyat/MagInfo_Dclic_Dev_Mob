import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A placeholder page representing the Paramètres (settings) tab.
///
/// This page currently contains only a simple message.  Future
/// enhancements could add toggles, preferences and account management.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paramètres',
          style: GoogleFonts.arya(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Paramètres à venir',
          style: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}