import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _auth = FirebaseAuth.instance;
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Actualiza la contraseña del usuario actual
        User? user = _auth.currentUser;
        await user?.updatePassword(_newPasswordController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Contraseña actualizada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );

        // Regresa a la pantalla anterior
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        String message = 'Ocurrió un error';
        if (e.code == 'weak-password') {
          message = 'La contraseña es demasiado débil';
        } else if (e.code == 'requires-recent-login') {
          message = 'Por seguridad, inicia sesión nuevamente';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar Contraseña"),
        backgroundColor: Colors.pink.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actualiza tu contraseña de forma segura',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Asegúrate de elegir una contraseña fuerte que no hayas usado antes.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Nueva Contraseña',
                      labelStyle: const TextStyle(color: Colors.pink),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade700),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese una nueva contraseña';
                      } else if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      labelStyle: const TextStyle(color: Colors.pink),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade700),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value != _newPasswordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _updatePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade700,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Actualizar Contraseña',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
