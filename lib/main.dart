import 'package:flutter/material.dart';
import 'package:homework_calculador/widgets/nav_drawer.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(68, 108, 108, 108),
          elevation: 0,
          title: const Text('Calculadora'),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/anime.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
