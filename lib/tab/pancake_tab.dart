// import 'package:flutter/material.dart';

// import '../Pancake_tile.dart';

// class PancakeTab extends StatelessWidget {
//   final List pancakeOnSale = [
//     ["Buttermilk Pancakes", "50", Colors.brown, "lib/images/pancake1.png"],
//     ["Banana Pancakes", "60", Colors.yellow, "lib/images/pancake2.png"],
//     ["Blueberry Pancakes", "70", Colors.red, "lib/images/pancake3.png"],
//     ["Chocolate Chip Pancakes", "65", Colors.green, "lib/images/pancake4.png"],
//     ["Oatmeal Pancakes", "75", Colors.deepOrange, "lib/images/pancake1.png"],
//     ["Whole Wheat Pancakes", "85", Colors.amber, "lib/images/pancake2.png"],
//     ["Gluten-Free Pancakes", "80", Colors.orange, "lib/images/pancake3.png"],
//     ["Potato Pancakes ", "68", Colors.grey, "lib/images/pancake4.png"],
//   ];

//   final Function(double) addItem; // Función para agregar un item

//   PancakeTab({super.key, required this.addItem}); // Recibir la función en el constructor

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: pancakeOnSale.length,
//       padding: const EdgeInsets.all(12),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1.5,
//       ),
//       itemBuilder: (context, index) {
//         return PancakeTile(
//           pancakeName: pancakeOnSale[index][0],
//           pancakePrice: pancakeOnSale[index][1],
//           pancakeColor: pancakeOnSale[index][2],
//           imageName: pancakeOnSale[index][3],
//           addToCart: () {
//             addItem(double.parse(pancakeOnSale[index][1])); // Llama a la función addItem con el precio
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  final Function(double) addItem;
  
  PancakeTab({super.key, required this.addItem});

  // Reference to pancakes collection in Firestore
  final CollectionReference pancakes = 
      FirebaseFirestore.instance.collection('panqueques');

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
      stream: pancakes.snapshots(),
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
            
            return PancakeTile(
              pancakeName: data['nombre'] ?? 'No name',
              pancakePrice: data['precio'].toString(),
              pancakeColor: Colors.brown,
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