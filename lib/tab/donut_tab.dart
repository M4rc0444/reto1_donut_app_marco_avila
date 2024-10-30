// import 'package:flutter/material.dart';

// import '../Donut_tile.dart';

// class DonutTab extends StatelessWidget {
//   //list of donuts
//   final List donutsOnSale = [
//     // [donutFlavor, donutPrice, donutColor, imageName]
//     ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
//     ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
//     ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
//     ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
//     ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
//     ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
//     ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
//     ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
//   ];

//   final Function(double) addItem; // Función para agregar un item

//   DonutTab(
//       {super.key,
//       required this.addItem}); // Recibir la función en el constructor

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: donutsOnSale.length, // longitud del arreglo
//       padding: const EdgeInsets.all(12),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2), // dos columnas
//       itemBuilder: (context, index) {
//         return DonutTile(
//           donutFlavor: donutsOnSale[index][0],
//           donutPrice: donutsOnSale[index][1],
//           donutColor: donutsOnSale[index][2],
//           imageName: donutsOnSale[index][3],
//           // Agregar botón "Add"
//           addToCart: () {
//             addItem(double.parse(donutsOnSale[index]
//                 [1])); // Llama a la función addItem con el precio
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Donut_tile.dart';

class DonutTab extends StatelessWidget {
  final Function(double) addItem;

  DonutTab({super.key, required this.addItem});

  // Referencia a la colección de donas en Firestore
  final CollectionReference donasCollection =
      FirebaseFirestore.instance.collection('donas');

  // Método para convertir el string de color a Colors
  Color getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'purple':
        return Colors.purple;
      case 'brown':
        return Colors.brown;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: donasCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Algo salió mal'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            final data = document.data() as Map<String, dynamic>;

            return DonutTile(
              donutFlavor: data['nombre'] ?? 'Sin nombre',
              donutPrice: data['precio'].toString(),
              donutColor: Colors.brown,
              imageName: data['foto'] ?? '',
              addToCart: () {
                addItem(double.parse(data['precio'].toString()));
              },
            );
          },
        );
      },
    );
  }
}
