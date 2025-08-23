import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_card.dart';

/// Represents the main content of the "Accueil" tab.
///
/// This screen follows the supplied design: a custom AppBar with a
/// hamburger and search icon, a hero section with a composite
/// magazine image, a welcome message and description, contact buttons,
/// and a horizontally scrolling list of category cards.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // In a production app this would open a drawer or navigation menu.
          },
        ),
        title: Text(
          'Magazine Infos',
          style: GoogleFonts.arya(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image section replicating the magazine spread.  The
            // container preserves aspect ratio by specifying a fixed
            // height.  Using ClipRRect rounds the corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/mag.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Bienvenue au Magazine Infos',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'Votre magazine numérique, votre source d’inspiration',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              "Magazine infos est bien plus qu’un simple magazine d’informations. "
              "C’est votre passerelle vers le monde, une source inestimable de "
              "connaissances et d’actualités soigneusement sélectionnées pour "
              "vous éclairer sur les enjeux mondiaux, la culture, la science et "
              "voir même le divertissement (les jeux).",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            // Contact icons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ContactButton(
                  icon: Icons.call,
                  label: 'TEL',
                  onTap: () {
                    // In a real app this would trigger a call action.
                  },
                ),
                _ContactButton(
                  icon: Icons.email_outlined,
                  label: 'MAIL',
                  onTap: () {
                    // In a real app this would open an email composer.
                  },
                ),
                _ContactButton(
                  icon: Icons.share_outlined,
                  label: 'PARTAGE',
                  onTap: () {
                    // In a real app this would open sharing options.
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Nos sélections',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            // Horizontal scrolling list of category cards
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    imagePath: 'assets/images/pexels-bradleyhook-123335.jpg',
                  ),
                  CategoryCard(
                    imagePath: 'assets/images/pexels-jplenio-1105379.jpg',
                  ),
                  CategoryCard(
                    imagePath: 'assets/images/pexels-pixabay-257699.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A small helper widget for the contact row.  It displays an icon
/// above a label and wraps them with a tap handler.
class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}