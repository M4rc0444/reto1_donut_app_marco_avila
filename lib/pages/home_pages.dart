import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Column(
        children: [
          //Texto I want to eat
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: [
                Text(
                  "I want to ",
                  style: TextStyle(fontSize: 32),
                ),
                Text("Eat",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
