<<<<<<< HEAD
// import 'package:flutter/material.dart';

// class DonutTile extends StatelessWidget {
//   final String donutFlavor;
//   final String donutPrice;
//   final dynamic donutColor;
//   final String imageName;
//   final double borderRadius = 24;
//   final VoidCallback addToCart; // Callback para agregar al carrito

//   const DonutTile({
//     super.key,
//     required this.donutFlavor,
//     required this.donutPrice,
//     this.donutColor,
//     required this.imageName,
//     required this.addToCart, // Aceptar el callback en el constructor
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Container(
//         height: 250, // Ajusta la altura para evitar desbordamientos
//         decoration: BoxDecoration(
//           color: donutColor[50],
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: Column(
//           children: [
//             // Donut price
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: donutColor[100],
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(borderRadius),
//                       bottomLeft: Radius.circular(borderRadius),
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
//                   child: Text(
//                     '\$$donutPrice',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: donutColor[800],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // Donut picture
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 child: Image.asset(imageName, fit: BoxFit.contain),
//               ),
//             ),
//             // Donut flavor text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
//               child: Text(
//                 donutFlavor,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                   color: donutColor[1000],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text('Dunkin\'s'),
//             // Love icon + add button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.favorite,
//                     color: Colors.pink[400],
//                   ),
//                   // Botón más pequeño alineado a la derecha
//                   ElevatedButton(
//                     onPressed: addToCart, // Llama al callback al presionar el botón
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8,
//                         horizontal: 20,
//                       ),
//                       minimumSize: const Size(60, 30), // Tamaño más pequeño
//                     ),
//                     child: const Text('ADD'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
=======
>>>>>>> 0681a2e (Programa final)
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DonutTile extends StatelessWidget {
<<<<<<< HEAD
  final String donutFlavor;
=======
  final String donutName; // Cambié 'donutFlavor' a 'donutName'
>>>>>>> 0681a2e (Programa final)
  final String donutPrice;
  final dynamic donutColor;
  final String imageName;
  final double borderRadius = 24;
  final VoidCallback addToCart;

  const DonutTile({
    super.key,
<<<<<<< HEAD
    required this.donutFlavor,
=======
    required this.donutName,
>>>>>>> 0681a2e (Programa final)
    required this.donutPrice,
    this.donutColor,
    required this.imageName,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // Donut price
            Row(
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
<<<<<<< HEAD
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
=======
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
>>>>>>> 0681a2e (Programa final)
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
            // Donut picture
            Expanded(
              child: Padding(
<<<<<<< HEAD
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CachedNetworkImage(
                  imageUrl: imageName,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
=======
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CachedNetworkImage(
                  imageUrl: imageName,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const CircularProgressIndicator(),
>>>>>>> 0681a2e (Programa final)
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
<<<<<<< HEAD
            // Donut flavor text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                donutFlavor,
=======
            // Donut name text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                donutName,
>>>>>>> 0681a2e (Programa final)
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: donutColor[800],
                ),
              ),
            ),
            const SizedBox(height: 4),
<<<<<<< HEAD
            const Text('Dunkin\'s'),
=======
            const Text('Delicious Donut'), // Cambié el texto aquí
>>>>>>> 0681a2e (Programa final)
            // Love icon + add button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  ElevatedButton(
                    onPressed: addToCart,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      minimumSize: const Size(60, 30),
                    ),
                    child: const Text('ADD'),
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
