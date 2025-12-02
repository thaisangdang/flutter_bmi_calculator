import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // THEME SETUP
      // Instead of manual colors everywhere, we override the dark theme.
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Dark Navy
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21), 
        ),
      ),
      home: const InputPage(),
    );
  }
}
