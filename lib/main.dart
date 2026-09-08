import 'package:flutter/material.dart';
import 'navbar.dart';
import 'pages/beranda_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reisya Putri',
      home: const MyHomePage(),
    );
  }
}