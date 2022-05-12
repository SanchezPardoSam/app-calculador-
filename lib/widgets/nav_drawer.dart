import 'package:flutter/material.dart';
import 'package:homework_calculador/first_route.dart';
import 'package:homework_calculador/fourth_route.dart';
import 'package:homework_calculador/main.dart';
import 'package:homework_calculador/second_route.dart';
import 'package:homework_calculador/third_route.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Divider(
            height: 5.0,
          ),
          const DrawerHeader(
            child: Material(
              child: Text(
                'Calculators',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
           ListTile(
            title: Text("Calculator Basic"),
            trailing: Icon(Icons.calculate),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstRoute(),
                ),
              );
            },
          ),
          const Divider(
            height: 5.0,
          ),
          ListTile(
            title: const Text("Calculator RadioButtons"),
            trailing: const Icon(Icons.calculate_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ),
              );
            },
          ),
          const Divider(
            height: 5.0,
          ),
          ListTile(
            title: const Text("Calculator Buttons"),
            trailing: const Icon(Icons.calculate_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdRoute(),
                ),
              );
            },
          ),
          const Divider(
            height: 5.0,
          ),
          ListTile(
            title: const Text("Calculator CheckBox"),
            trailing: const Icon(Icons.calculate_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FourthRoute(),
                ),
              );
            },
          ),
          const Divider(
            height: 5.0,
          ),
          ListTile(
            title: const Text("Cerrar"),
            trailing: const Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
