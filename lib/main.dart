import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const FooderlichPro());
}

class FooderlichPro extends StatelessWidget {
  const FooderlichPro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich Pro',
      home: const Home(),
    );
  }
}
