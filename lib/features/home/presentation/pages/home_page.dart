import 'package:flutter/material.dart';

import '../../../news/presentation/pages/news_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import 'home_screen.dart';

/// A top level page that manages bottom navigation and delegates to
/// individual tab screens.  This widget maintains the currently
/// selected index and rebuilds the appropriate body when tapped.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // The three pages that make up the bottom navigation tabs.
  final List<Widget> _pages = const <Widget>[
    HomeScreen(),
    NewsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Each tab provides its own AppBar where needed.  Wrapping
      // with [Scaffold] allows each page to set its own AppBar and
      // avoid a global one that appears above every tab.
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}