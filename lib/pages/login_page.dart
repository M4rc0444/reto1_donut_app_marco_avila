<<<<<<< HEAD
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:reto1_donut_app_marco_avila/pages/forgot_password_page.dart';
// import 'package:reto1_donut_app_marco_avila/pages/registrarse.dart';
// import 'home_pages.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _login() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _usernameController.text,
//         password: _passwordController.text,
//       );

//       if (userCredential.user?.emailVerified == true) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('Por favor verifica tu correo electrónico')),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       String message = 'Error desconocido';
//       if (e.code == 'user-not-found') {
//         message = 'No hay ningún usuario registrado con este correo.';
//       } else if (e.code == 'wrong-password') {
//         message = 'Contraseña incorrecta.';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.pink, Colors.pink],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Center(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: constraints.maxWidth * 0.1,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Bienvenido,",
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "inicia sesión para continuar",
//                       style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight * 0.05),
//                     Image.asset("lib/images/logo2.png",
//                         width: constraints.maxWidth * 0.5),
//                     SizedBox(height: constraints.maxHeight * 0.03),
//                     Container(
//                       padding: EdgeInsets.all(constraints.maxWidth * 0.05),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             spreadRadius: 5,
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: constraints.maxWidth * 0.02,
//                               vertical: constraints.maxHeight * 0.01,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: Colors.grey.withOpacity(.2),
//                             ),
//                             child: TextFormField(
//                               controller: _usernameController,
//                               decoration: const InputDecoration(
//                                 icon: Icon(Icons.person),
//                                 border: InputBorder.none,
//                                 hintText: "Correo Electrónico",
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: constraints.maxHeight * 0.02),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: constraints.maxWidth * 0.02,
//                               vertical: constraints.maxHeight * 0.01,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: Colors.grey.withOpacity(.2),
//                             ),
//                             child: TextFormField(
//                               controller: _passwordController,
//                               obscureText: true,
//                               decoration: const InputDecoration(
//                                 icon: Icon(Icons.lock),
//                                 border: InputBorder.none,
//                                 hintText: "Contraseña",
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: constraints.maxHeight * 0.02),
//                           ElevatedButton(
//                             onPressed: _login,
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: Colors.pink[400],
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: constraints.maxWidth * 0.25,
//                                 vertical: constraints.maxHeight * 0.025,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(90.0),
//                               ),
//                             ),
//                             child: const Text(
//                               'Iniciar sesión',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       const ForgotPasswordPage(),
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               '¿Olvidaste tu contraseña?',
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "¿Aún no tienes una cuenta?",
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Registrate()),
//                             );
//                           },
//                           child: const Text(
//                             "Regístrate",
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reto1_donut_app_marco_avila/pages/forgot_password_page.dart';
import 'package:reto1_donut_app_marco_avila/pages/registrarse.dart';
=======
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/forgot_password_page.dart';
import 'package:flutter_application_1/pages/registrarse.dart';
import 'package:google_sign_in/google_sign_in.dart';

>>>>>>> 0681a2e (Programa final)
import 'home_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Función de inicio de sesión con Google
  Future<void> signInWithGoogle() async {
    try {
<<<<<<< HEAD
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Obtén la URL de la imagen de perfil
        String? profileImageUrl = googleUser.photoUrl;

        // Navega a HomePage y pasa la URL de la imagen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(profileImageUrl: profileImageUrl), // Pasa la imagen
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al iniciar sesión con Google: $e")),
=======
      // Muestra indicador de carga
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        Navigator.of(context).pop(); // Cierra el indicador de carga
        return; // Usuario canceló el inicio de sesión
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Cierra el indicador de carga
      Navigator.of(context).pop();

      // Navega a HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(profileImageUrl: googleUser.photoUrl),
        ),
      );
    } catch (e) {
      // Cierra el indicador de carga si está visible
      Navigator.of(context).pop();

      print('Error en Google Sign In: $e'); // Para depuración
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión con Google: $e'),
          duration: const Duration(seconds: 3),
        ),
>>>>>>> 0681a2e (Programa final)
      );
    }
  }

  void _login() async {
    try {
<<<<<<< HEAD
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );

=======
      // Muestra un indicador de carga
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _usernameController.text.trim(), // Añade trim()
        password: _passwordController.text.trim(),
      );

      // Cierra el indicador de carga
      Navigator.of(context).pop();

>>>>>>> 0681a2e (Programa final)
      if (userCredential.user?.emailVerified == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
<<<<<<< HEAD
              content: Text('Por favor verifica tu correo electrónico')),
        );
      }
    } on FirebaseAuthException catch (e) {
=======
            content: Text('Por favor verifica tu correo electrónico'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Cierra el indicador de carga
      Navigator.of(context).pop();

>>>>>>> 0681a2e (Programa final)
      String message = 'Error desconocido';
      if (e.code == 'user-not-found') {
        message = 'No hay ningún usuario registrado con este correo.';
      } else if (e.code == 'wrong-password') {
        message = 'Contraseña incorrecta.';
<<<<<<< HEAD
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
=======
      } else if (e.code == 'invalid-email') {
        message = 'El formato del correo electrónico no es válido.';
      } else {
        message = e.message ??
            'Error desconocido'; // Muestra el mensaje de error completo
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Cierra el indicador de carga
      Navigator.of(context).pop();

      print('Error no manejado: $e'); // Para depuración
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 3),
        ),
>>>>>>> 0681a2e (Programa final)
      );
    }
  }

  // Función para iniciar sesión de manera anónima
  void _loginAnonymously() async {
    try {
      await _auth.signInAnonymously();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Bienvenido,",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "inicia sesión para continuar",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Image.asset("lib/images/logo2.png",
                        width: constraints.maxWidth * 0.5),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    Container(
                      padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.02,
                              vertical: constraints.maxHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(.2),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                border: InputBorder.none,
                                hintText: "Correo Electrónico",
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.02,
                              vertical: constraints.maxHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(.2),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                border: InputBorder.none,
                                hintText: "Contraseña",
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.pink[400],
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.25,
                                vertical: constraints.maxHeight * 0.025,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          ElevatedButton.icon(
                            onPressed: signInWithGoogle,
                            icon: const Icon(Icons.account_circle),
                            label: const Text('Iniciar sesión con Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.15,
                                vertical: constraints.maxHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                            ),
                          ),
                          // Botón para iniciar sesión de manera anónima
                          ElevatedButton(
                            onPressed: _loginAnonymously,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Colors.blue, // Cambia el color si lo deseas
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.25,
                                vertical: constraints.maxHeight * 0.025,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                            ),
                            child: const Text(
                              'Iniciar sesión como invitado',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: const Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿Aún no tienes una cuenta?",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Registrate(),
                              ),
                            );
                          },
                          child: const Text(
                            "Regístrate",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
=======
      backgroundColor: const Color(0xFFE91E63), // Color rosa específico
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Botón de retroceso
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 40),
                // Logo de la aplicación
                Image.asset(
                  "lib/images/logo2.png", // Ruta de tu imagen
                  width: MediaQuery.of(context).size.width *
                      0.5, // Ajusta el ancho
                ),
                const SizedBox(height: 20),
                // Contenedor principal blanco
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      // Campo de correo electrónico
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Correo Electrónico",
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Campo de contraseña
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Contraseña",
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Botón de iniciar sesión
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE91E63),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón de Google
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: OutlinedButton.icon(
                          onPressed: signInWithGoogle,
                          icon: const Icon(Icons.person_outline),
                          label: const Text('Iniciar sesión con Google'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón de invitado
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _loginAnonymously,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Iniciar sesión como invitado',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Enlace de contraseña olvidada
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Texto de registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Aún no tienes una cuenta?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Registrate(),
                          ),
                        );
                      },
                      child: const Text(
                        'Regístrate',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
>>>>>>> 0681a2e (Programa final)
