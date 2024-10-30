import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reto1_donut_app_marco_avila/pages/login_page.dart';
import 'package:reto1_donut_app_marco_avila/pages/updatepasswordpage.dart';
import 'package:reto1_donut_app_marco_avila/tab/burger_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/donut_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/pancake_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/pizza_tab.dart';
import 'package:reto1_donut_app_marco_avila/tab/smoothie_tab.dart';

class HomePage extends StatefulWidget {
  final String? profileImageUrl; // Declara profileImageUrl

  const HomePage({Key? key, this.profileImageUrl})
      : super(key: key); // Constructor

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int itemCount = 0;
  double totalAmount = 0.0;

  List<Tab> myTabs = [
    const Tab(
        icon: ImageIcon(AssetImage('lib/icons/donut.png')), text: 'Donuts'),
    const Tab(
        icon: ImageIcon(AssetImage('lib/icons/burger.png')), text: 'Burgers'),
    const Tab(
        icon: ImageIcon(AssetImage('lib/icons/smoothie.png')),
        text: 'Smoothies'),
    const Tab(
        icon: ImageIcon(AssetImage('lib/icons/pancakes.png')),
        text: 'Pancakes'),
    const Tab(
        icon: ImageIcon(AssetImage('lib/icons/pizza.png')), text: 'Pizzas'),
  ];

  void addItem(double price) {
    setState(() {
      itemCount++;
      totalAmount += price;
    });
  }

  void _showProfileMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: widget.profileImageUrl != null // Verifica si hay URL
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.profileImageUrl!), // Usa la URL
                      )
                    : const Icon(Icons.person,
                        color: Colors.pink), // Icono por defecto
                title: const Text('Perfil'),
                subtitle: Text(_auth.currentUser?.email ?? 'Invitado'),
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.pink),
                title: const Text('Actualizar Contraseña'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdatePasswordPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.pink),
                title: const Text('Cerrar Sesión'),
                onTap: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[800], size: 36),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.grey[800], size: 36),
                onPressed: _showProfileMenu,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Text(
                  'Menú',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text('Regresar'),
                onTap: () => Navigator.of(context).pop(),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Carrito'),
              ),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text('Información'),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32)),
                  Text(
                    "EAT",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: myTabs,
              labelColor: Colors.black,
              indicatorColor: Colors.pink,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addItem: addItem),
                  BurgerTab(addItem: addItem),
                  SmoothieTab(addItem: addItem),
                  PancakeTab(addItem: addItem),
                  PizzaTab(addItem: addItem),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$itemCount Items | \$$totalAmount',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Delivery Charges Included',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón "View Cart"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
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
      home: HomePage(),
    ),
  );
}
