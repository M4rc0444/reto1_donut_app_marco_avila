// import 'package:flutter/material.dart';
// import '../Pizza_tile.dart';

// class PizzaTab extends StatelessWidget {
//   final List pizzaOnSale = [
//     ["Margherita Pizza", "50", Colors.brown, "lib/images/pizza1.png"],
//     ["Pepperoni Pizza", "60", Colors.yellow, "lib/images/pizza2.png"],
//     ["Hawaiian Pizza", "70", Colors.red, "lib/images/pizza3.png"],
//     ["Four Cheese Pizza", "65", Colors.green, "lib/images/pizza4.png"],
//     ["Vegetarian Pizza", "75", Colors.deepOrange, "lib/images/pizza1.png"],
//     ["BBQ Chicken Pizza", "85", Colors.amber, "lib/images/pizza2.png"],
//     ["Meat Lover's Pizza", "80", Colors.orange, "lib/images/pizza3.png"],
//     ["White Pizza", "68", Colors.grey, "lib/images/pizza4.png"],
//   ];

//   final Function(double) addItem; // Función para agregar un item

//   PizzaTab({super.key, required this.addItem}); // Recibir la función en el constructor

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: pizzaOnSale.length,
//       padding: const EdgeInsets.all(12),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1.5,
//       ),
//       itemBuilder: (context, index) {
//         return PizzaTile(
//           pizzaName: pizzaOnSale[index][0],
//           pizzaPrice: pizzaOnSale[index][1],
//           pizzaColor: pizzaOnSale[index][2],
//           imageName: pizzaOnSale[index][3],
//           addToCart: () {
//             addItem(double.parse(pizzaOnSale[index][1])); // Llama a la función addItem con el precio
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final Function(double) addItem;

  PizzaTab({super.key, required this.addItem});

  // Reference to pizzas collection in Firestore
  final CollectionReference pizzas =
      FirebaseFirestore.instance.collection('pizza');

  // Method to convert string color to Colors
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
      stream: pizzas.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
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

            return PizzaTile(
              pizzaName: data['nombre'] ?? 'No name',
              pizzaPrice: data['precio'].toString(),
              pizzaColor: Colors.brown,
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
