import 'package:flutter/material.dart';
import '../Smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  final List smoothieOnSale = [
    ["Berry Smoothie", "50", Colors.brown, "lib/images/smoothie1.png"],
    ["Green Smoothie", "60", Colors.yellow, "lib/images/smoothie2.png"],
    ["Tropical Smoothie", "70", Colors.red, "lib/images/smoothie3.png"],
    ["Banana Smoothie", "65", Colors.green, "lib/images/smoothie4.png"],
    ["Strawberry Banana Smoothie", "75", Colors.deepOrange, "lib/images/smoothie1.png"],
    ["Avocado Smoothie", "85", Colors.amber, "lib/images/smoothie2.png"],
    ["Peanut Butter Smoothie", "80", Colors.orange, "lib/images/smoothie3.png"],
    ["Chocolate Smoothie", "68", Colors.grey, "lib/images/smoothie4.png"],
  ];

  final Function(double) addItem; // Función para agregar un item

  SmoothieTab({super.key, required this.addItem}); // Recibir la función en el constructor

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothieOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieName: smoothieOnSale[index][0],
          smoothiePrice: smoothieOnSale[index][1],
          smoothieColor: smoothieOnSale[index][2],
          imageName: smoothieOnSale[index][3],
          addToCart: () {
            addItem(double.parse(smoothieOnSale[index][1])); // Llama a la función addItem con el precio
          },
        );
      },
    );
  }
}
