import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../writers/presentation/pages/writers_page.dart';

/// A settings page with various management options.
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsCard(
            context,
            icon: Icons.people,
            title: 'Gestion des Rédacteurs',
            subtitle: 'Ajouter, modifier et supprimer des rédacteurs',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WritersPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            icon: Icons.settings,
            title: 'Paramètres Généraux',
            subtitle: 'Configuration de l\'application',
            onTap: () {
              // TODO: Implémenter les paramètres généraux
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fonctionnalité à venir'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            icon: Icons.info,
            title: 'À propos',
            subtitle: 'Informations sur l\'application',
            onTap: () {
              // TODO: Implémenter la page à propos
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fonctionnalité à venir'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue[700]),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}