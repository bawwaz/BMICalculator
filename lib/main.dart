import 'package:flutter/material.dart';
import 'BMI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 192, 213)),
        useMaterial3: true,
      ),
      home: BMI(
        title: 'BMI Calculator',
      ),
    );
  }
}
