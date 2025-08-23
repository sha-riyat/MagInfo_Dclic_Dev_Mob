import 'package:flutter/material.dart';

/// A simple card used in the horizontal list to showcase featured
/// content or categories.  It displays an image with rounded
/// corners.  The width and height are fixed to ensure a consistent
/// appearance across devices.
class CategoryCard extends StatelessWidget {
  final String imagePath;

  const CategoryCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: 160,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}