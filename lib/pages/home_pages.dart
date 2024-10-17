import 'package:flutter/material.dart';
import 'package:reto1_donut_app_marco_avila/tab/burguer_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/donut_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/pancake_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/pizza_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/smoothie_tab.dart';
import 'package:reto1_donut_app_marco_avila/utils/my_tab.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Widget> myTabs = [
    const MyTab(
      iconPath: 'lib/icons/donut.png',
      label: 'Donuts', // Añadir nombre
    ),
    const MyTab(
      iconPath: 'lib/icons/burger.png',
      label: 'Burgers', // Añadir nombre
    ),
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
      label: 'Smoothies', // Añadir nombre
    ),
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
      label: 'Pancakes', // Añadir nombre
    ),
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
      label: 'Pizza', // Añadir nombre
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[800], size: 36),
              onPressed: () {
                print("Menu button pressed");
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(
                Icons.person,
                color: Colors.grey[800],
                size: 36,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Texto I want to eat
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text("EAT",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            // TabBar para las categorías
            TabBar(
              tabs: myTabs,
              labelColor: Colors.black,
              indicatorColor: Colors.pink,
            ),
            // Vista de las Tabs (Donut, Burguer, etc.)
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(), // Aquí va la vista de las donas
                  BurguerTab(), // Aquí va la vista de las hamburguesas
                  SmoothieTab(), // Aquí va la vista de los smoothies
                  PancakeTab(), // Aquí va la vista de los pancakes
                  PizzaTab(), // Aquí va la vista de las pizzas
                ],
              ),
            ),
            // Parte inferior con la información de los items y el botón de View Cart
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:
                        const Offset(0, -1), // Cambia la sombra hacia arriba
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2 Items | \$45',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Delivery Charges Included',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón View Cart
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Color del botón
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'View Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
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

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
    ),
  );
}
