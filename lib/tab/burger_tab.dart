import 'package:flutter/material.dart';

import '../Burger_tile.dart';

//PRUEBA DE MODIFICACIÓN

class BurgerTab extends StatelessWidget {
  final List burgersOnSale = [
    ["Classic Burger", "50", Colors.brown, "lib/images/burguer1.png"],
    ["Cheese Burger", "60", Colors.yellow, "lib/images/burguer2.png"],
    ["Bacon Burger", "70", Colors.red, "lib/images/burguer3.png"],
    ["Vegan Burger", "65", Colors.green, "lib/images/burguer4.png"],
    ["BBQ Burger", "75", Colors.deepOrange, "lib/images/burguer1.png"],
    ["Double Cheese Burger", "85", Colors.amber, "lib/images/burguer2.png"],
    ["Spicy Chicken Burger", "80", Colors.orange, "lib/images/burguer3.png"],
    ["Mushroom Burger", "68", Colors.grey, "lib/images/burguer4.png"],
  ];

  final Function(double) addItem; // Función para agregar un item

  BurgerTab({super.key, required this.addItem}); // Recibir la función en el constructor

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerName: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
          addToCart: () {
            addItem(double.parse(burgersOnSale[index][1])); // Llama a la función addItem con el precio
          },
        );
      },
    );
  }
}
