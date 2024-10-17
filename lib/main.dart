import 'package:flutter/material.dart';
import 'package:reto1_donut_app_marco_avila/pages/home_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePages(),
        theme: ThemeData(
          tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink),
        ));
  }
}
