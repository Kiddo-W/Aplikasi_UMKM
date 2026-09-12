import 'package:flutter/material.dart';
import 'features/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reisya Putri',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}