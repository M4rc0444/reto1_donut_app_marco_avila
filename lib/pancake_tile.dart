<<<<<<< HEAD
// import 'package:flutter/material.dart';

// class PancakeTile extends StatelessWidget {
//   final String pancakeName;
//   final String pancakePrice;
//   final dynamic pancakeColor;
//   final String imageName;
//   final double borderRadius = 24;
//   final VoidCallback addToCart; // Callback para agregar al carrito

//   const PancakeTile({
//     super.key,
//     required this.pancakeName,
//     required this.pancakePrice,
//     this.pancakeColor,
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
//           color: pancakeColor[50],
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: Column(
//           children: [
//             // Pancake price
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: pancakeColor[100],
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(borderRadius),
//                       bottomLeft: Radius.circular(borderRadius),
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
//                   child: Text(
//                     '\$$pancakePrice',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: pancakeColor[800],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // Pancake picture
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 child: Image.asset(imageName, fit: BoxFit.contain),
//               ),
//             ),
//             // Pancake name text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
//               child: Text(
//                 pancakeName,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                   color: pancakeColor[1000],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text('Pancake House'),
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

class PancakeTile extends StatelessWidget {
  final String pancakeName;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String imageName;
  final double borderRadius = 24;
  final VoidCallback addToCart;

  const PancakeTile({
    super.key,
    required this.pancakeName,
    required this.pancakePrice,
    this.pancakeColor,
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
          color: pancakeColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // Pancake price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pancakeColor[100],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pancakeColor[800],
                    ),
                  ),
                )
              ],
            ),
            // Pancake picture
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CachedNetworkImage(
                  imageUrl: imageName,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            // Pancake name text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                pancakeName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: pancakeColor[800],
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text('Pancake House'),
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
