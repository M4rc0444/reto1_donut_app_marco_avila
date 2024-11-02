<<<<<<< HEAD
// import 'package:flutter/material.dart';

// class SmoothieTile extends StatelessWidget {
//   final String smoothieName;
//   final String smoothiePrice;
//   final dynamic smoothieColor;
//   final String imageName;
//   final double borderRadius = 24;
//   final VoidCallback addToCart; // Callback para agregar al carrito

//   const SmoothieTile({
//     super.key,
//     required this.smoothieName,
//     required this.smoothiePrice,
//     this.smoothieColor,
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
//           color: smoothieColor[50],
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: Column(
//           children: [
//             // Smoothie price
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: smoothieColor[100],
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(borderRadius),
//                       bottomLeft: Radius.circular(borderRadius),
//                     ),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
//                   child: Text(
//                     '\$$smoothiePrice',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: smoothieColor[800],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // Smoothie picture
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 child: Image.asset(imageName, fit: BoxFit.contain),
//               ),
//             ),
//             // Smoothie name text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
//               child: Text(
//                 smoothieName,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                   color: smoothieColor[1000],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text('Smoothie Bar'),
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
//                     onPressed:
//                         addToCart, // Llama al callback al presionar el botón
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

class SmoothieTile extends StatelessWidget {
  final String smoothieName;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String imageName;
  final double borderRadius = 24;
  final VoidCallback addToCart;

  const SmoothieTile({
    super.key,
    required this.smoothieName,
    required this.smoothiePrice,
    this.smoothieColor,
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
          color: smoothieColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // Smoothie price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: smoothieColor[100],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$smoothiePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: smoothieColor[800],
                    ),
                  ),
                )
              ],
            ),
            // Smoothie picture
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
            // Smoothie name text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                smoothieName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: smoothieColor[800],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            const Text('Smoothie Bar'),
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
