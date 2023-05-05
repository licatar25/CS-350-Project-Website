import 'package:flutter/material.dart';
import 'common/common.dart';
import 'home_screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemeData.lightThemeData,
      //theme: AppThemeData.darkThemeData,
      home: const Scaffold(body: HomeScreen()),
    );
  }
}
