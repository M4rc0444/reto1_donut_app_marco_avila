import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:reto1_donut_app_marco_avila/firebase_options.dart';
=======
import 'package:flutter_application_1/firebase_options.dart';
>>>>>>> 0681a2e (Programa final)
import 'pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Error inicializando Firebase: $e");
  }

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
