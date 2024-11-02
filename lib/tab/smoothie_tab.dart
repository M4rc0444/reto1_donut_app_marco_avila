<<<<<<< HEAD
// import 'package:flutter/material.dart';
// import '../Smoothie_tile.dart';

// class SmoothieTab extends StatelessWidget {
//   final List smoothieOnSale = [
//     ["Berry Smoothie", "50", Colors.brown, "lib/images/smoothie1.png"],
//     ["Green Smoothie", "60", Colors.yellow, "lib/images/smoothie2.png"],
//     ["Tropical Smoothie", "70", Colors.red, "lib/images/smoothie3.png"],
//     ["Banana Smoothie", "65", Colors.green, "lib/images/smoothie4.png"],
//     ["Strawberry Banana Smoothie", "75", Colors.deepOrange, "lib/images/smoothie1.png"],
//     ["Avocado Smoothie", "85", Colors.amber, "lib/images/smoothie2.png"],
//     ["Peanut Butter Smoothie", "80", Colors.orange, "lib/images/smoothie3.png"],
//     ["Chocolate Smoothie", "68", Colors.grey, "lib/images/smoothie4.png"],
//   ];

//   final Function(double) addItem; // Función para agregar un item

//   SmoothieTab({super.key, required this.addItem}); // Recibir la función en el constructor

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: smoothieOnSale.length,
//       padding: const EdgeInsets.all(12),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1.5,
//       ),
//       itemBuilder: (context, index) {
//         return SmoothieTile(
//           smoothieName: smoothieOnSale[index][0],
//           smoothiePrice: smoothieOnSale[index][1],
//           smoothieColor: smoothieOnSale[index][2],
//           imageName: smoothieOnSale[index][3],
//           addToCart: () {
//             addItem(double.parse(smoothieOnSale[index][1])); // Llama a la función addItem con el precio
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Smoothie_tile.dart';
=======
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/smoothie_tile.dart';

>>>>>>> 0681a2e (Programa final)

class SmoothieTab extends StatelessWidget {
  final Function(double) addItem;
  
  SmoothieTab({super.key, required this.addItem});

<<<<<<< HEAD
  // Referencia a la colección de batidos en Firestore
=======
  //Aqui se vincula con la base de datos de firebase y se vincula a la tabla batido
>>>>>>> 0681a2e (Programa final)
  final CollectionReference batidos = 
      FirebaseFirestore.instance.collection('batido');

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
        return Colors.purple; // Color por defecto para batidos
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: batidos.snapshots(),
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
            
            return SmoothieTile(
              smoothieName: data['nombre'] ?? 'Sin nombre',
              smoothiePrice: data['precio'].toString(),
              smoothieColor: Colors.purple, // Color base para batidos
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