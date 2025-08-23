import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A placeholder page representing the News tab.
///
/// In a real application this would fetch and display a list of
/// articles.  For now it simply shows a message in the centre of
/// the screen.
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          style: GoogleFonts.arya(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Contenu à venir',
          style: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}