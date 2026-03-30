import 'package:apple_shop_y213_31/ui/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iphone17 Shop",
      home: const Scaffold(body: MainPage()),
    );
  }
}
