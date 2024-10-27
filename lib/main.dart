import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reto1_donut_app_marco_avila/firebase_options.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Cambia para mostrar primero la página de login
      theme: ThemeData(
        tabBarTheme:
            const TabBarTheme(indicatorColor: Color.fromARGB(255, 255, 46, 46)),
      ),
    );
  }
}
