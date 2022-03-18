import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'screens/splash_screen.dart';
// TODO: Import app_router

void main() {
  runApp(
    const FooderlichPro(),
  );
}

class FooderlichPro extends StatefulWidget {
  const FooderlichPro({Key? key}) : super(key: key);

  @override
  _FooderlichProState createState() => _FooderlichProState();
}

class _FooderlichProState extends State<FooderlichPro> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  // TODO: Define AppRouter

  // TODO: Initialize app router

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }

          return MaterialApp(
            theme: theme,
            title: 'Fooderlich',
            // TODO: Replace with Router widget
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
