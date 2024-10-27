import 'package:flutter/material.dart';
import '../Pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final List pizzaOnSale = [
    ["Margherita Pizza", "50", Colors.brown, "lib/images/pizza1.png"],
    ["Pepperoni Pizza", "60", Colors.yellow, "lib/images/pizza2.png"],
    ["Hawaiian Pizza", "70", Colors.red, "lib/images/pizza3.png"],
    ["Four Cheese Pizza", "65", Colors.green, "lib/images/pizza4.png"],
    ["Vegetarian Pizza", "75", Colors.deepOrange, "lib/images/pizza1.png"],
    ["BBQ Chicken Pizza", "85", Colors.amber, "lib/images/pizza2.png"],
    ["Meat Lover's Pizza", "80", Colors.orange, "lib/images/pizza3.png"],
    ["White Pizza", "68", Colors.grey, "lib/images/pizza4.png"],
  ];

  final Function(double) addItem; // Función para agregar un item

  PizzaTab({super.key, required this.addItem}); // Recibir la función en el constructor

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzaOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaName: pizzaOnSale[index][0],
          pizzaPrice: pizzaOnSale[index][1],
          pizzaColor: pizzaOnSale[index][2],
          imageName: pizzaOnSale[index][3],
          addToCart: () {
            addItem(double.parse(pizzaOnSale[index][1])); // Llama a la función addItem con el precio
          },
        );
      },
    );
  }
}
