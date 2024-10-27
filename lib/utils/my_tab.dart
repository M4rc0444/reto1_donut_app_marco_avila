import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label; // Agrega un nuevo parámetro para el texto

  const MyTab({super.key, required this.iconPath, required this.label}); // Asegúrate de requerir el texto

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, height: 24.0), // Ajusta la altura según sea necesario
        Text(label, style: const TextStyle(fontSize: 12)), // Añade el texto debajo del ícono
      ],
    );
  }
}
