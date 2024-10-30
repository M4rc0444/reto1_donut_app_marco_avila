// import 'package:flutter/material.dart';

// class PizzaTile extends StatelessWidget {
//   final String pizzaName;
//   final String pizzaPrice;
//   final dynamic pizzaColor;
//   final String imageName;
//   final double borderRadius = 24;
//   final VoidCallback addToCart; // Callback para agregar al carrito

//   const PizzaTile({
//     super.key,
//     required this.pizzaName,
//     required this.pizzaPrice,
//     this.pizzaColor,
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
//           color: pizzaColor[50],
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: Column(
//           children: [
//             // Pizza price
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: pizzaColor[100],
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(borderRadius),
//                       bottomLeft: Radius.circular(borderRadius),
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
//                   child: Text(
//                     '\$$pizzaPrice',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: pizzaColor[800],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // Pizza picture
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 child: Image.asset(imageName, fit: BoxFit.contain),
//               ),
//             ),
//             // Pizza name text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
//               child: Text(
//                 pizzaName,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                   color: pizzaColor[1000],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text('Pizza Place'),
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

class PizzaTile extends StatelessWidget {
  final String pizzaName;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String imageName;
  final double borderRadius = 24;
  final VoidCallback addToCart;

  const PizzaTile({
    super.key,
    required this.pizzaName,
    required this.pizzaPrice,
    this.pizzaColor,
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
          color: pizzaColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // Pizza price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pizzaColor[100],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$pizzaPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pizzaColor[800],
                    ),
                  ),
                )
              ],
            ),
            // Pizza picture
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CachedNetworkImage(
                  imageUrl: imageName,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => 
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            // Pizza name text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
              child: Text(
                pizzaName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: pizzaColor[800],
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text('Pizza Place'),
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