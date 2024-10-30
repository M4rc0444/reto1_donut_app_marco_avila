// import 'package:flutter/material.dart';

// import '../Burger_tile.dart';

// class BurgerTab extends StatelessWidget {
//   final List burgersOnSale = [
//     ["Classic Burger", "50", Colors.brown, "lib/images/burguer1.png"],
//     ["Cheese Burger", "60", Colors.yellow, "lib/images/burguer2.png"],
//     ["Bacon Burger", "70", Colors.red, "lib/images/burguer3.png"],
//     ["Vegan Burger", "65", Colors.green, "lib/images/burguer4.png"],
//     ["BBQ Burger", "75", Colors.deepOrange, "lib/images/burguer1.png"],
//     ["Double Cheese Burger", "85", Colors.amber, "lib/images/burguer2.png"],
//     ["Spicy Chicken Burger", "80", Colors.orange, "lib/images/burguer3.png"],
//     ["Mushroom Burger", "68", Colors.grey, "lib/images/burguer4.png"],
//   ];

//   final Function(double) addItem; // Función para agregar un item

//   BurgerTab({super.key, required this.addItem}); // Recibir la función en el constructor

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: burgersOnSale.length,
//       padding: const EdgeInsets.all(12),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1.5,
//       ),
//       itemBuilder: (context, index) {
//         return BurgerTile(
//           burgerName: burgersOnSale[index][0],
//           burgerPrice: burgersOnSale[index][1],
//           burgerColor: burgersOnSale[index][2],
//           imageName: burgersOnSale[index][3],
//           addToCart: () {
//             addItem(double.parse(burgersOnSale[index][1])); // Llama a la función addItem con el precio
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Burger_tile.dart';

class BurgerTab extends StatelessWidget {
  final Function(double) addItem;
  
  BurgerTab({super.key, required this.addItem});

  // Referencia a la colección de hamburguesas en Firestore
  final CollectionReference hamburguesas = 
      FirebaseFirestore.instance.collection('hamburguesas');

  // Método para convertir el string de color a Colors
  Color getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'brown':
        return Colors.brown;
      case 'yellow':
        return Colors.yellow;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'deeporange':
        return Colors.deepOrange;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.brown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: hamburguesas.snapshots(),
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
            childAspectRatio: 1 / 1.5,
          ),
          itemBuilder: (context, index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            final data = document.data() as Map<String, dynamic>;
            
            return BurgerTile(
              burgerName: data['nombre'] ?? 'Sin nombre',
              burgerPrice: data['precio'].toString(),
              burgerColor: Colors.brown,
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