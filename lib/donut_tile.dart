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
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String imageName;
  final double borderRadius = 24;
  final VoidCallback addToCart;

  const DonutTile({
    super.key,
    required this.donutFlavor,
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
            // Donut picture
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
            // Donut flavor text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                donutFlavor,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: donutColor[800],
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text('Dunkin\'s'),
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
