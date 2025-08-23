import 'package:flutter/material.dart';

import '../features/home/presentation/pages/home_page.dart';
import 'theme/app_theme.dart';

/// The root widget for the Magazine Infos application.
///
/// This widget sets up the [MaterialApp] with a light theme and
/// establishes the home page.  Routing and other high level
/// configuration would also live here if the app grew in scope.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Infos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}