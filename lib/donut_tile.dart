import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic
      donutColor; // dynamic porque será de tipo Color y también usará []
  final String imageName;

  final double borderRadius = 24;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    this.donutColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50], // Aquí se usa el dynamic
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // Precio de la dona
            Row(
              // Alinear a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$donutPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: donutColor[800],
                    ),
                  ),
                )
              ],
            ),
            // Imagen de la dona
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Image.asset(imageName),
            ),
            // Texto del sabor de la dona
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 4), // Un padding más pequeño
              child: Text(
                donutFlavor,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold, // Puedes cambiar el color si lo deseas
                ),
              ),
            ),
            // Texto "Dunkin's" debajo del sabor
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 12), // Opcionalmente agrega espacio extra si deseas
              child: Text(
                "Dunkin's",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[
                      600], // Un color gris para darle un toque secundario
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
