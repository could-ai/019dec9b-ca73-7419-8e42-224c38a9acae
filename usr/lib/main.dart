import 'package:flutter/material.dart';
import '../theme.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const SmmApp());
}

class SmmApp extends StatelessWidget {
  const SmmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMM Boosting Global',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}
