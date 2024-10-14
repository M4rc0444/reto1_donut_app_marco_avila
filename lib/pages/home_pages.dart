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
    ),
    //tab
//burger tab
    const MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
//smothie tab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
//pancake tab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
//pizza tab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
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
                print("hola mundo");
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
            //Texto I want to eat
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text("Cry",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
             Expanded(
                child: TabBarView(
              children: [
                DonutTab(),
                BurguerTab(),
                SmoothieTab(),
                PancakeTab(),
                PizzaTab(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
