import 'package:flutter/material.dart';
import 'screens/stroll_bonfire_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Updated to use super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stroll Bonfire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StrollBonfireScreen(),  // Added const
    );
  }
}
