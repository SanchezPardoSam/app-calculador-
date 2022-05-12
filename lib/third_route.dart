import 'package:flutter/material.dart';

class ThirdRoute extends StatefulWidget {
  ThirdRoute({Key? key}) : super(key: key);

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final formKey = GlobalKey<FormState>();
  double number1 = 0;
  double number2 = 0;
  double result = 0;
  sumar() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        result = number1 + number2;
      });
    }
  }

  restar() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        result = number1 - number2;
      });
    }
  }

  multiplicar() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        result = number1 * number2;
      });
    }
  }

  dividir() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        result = number1 / number2;
      });
    }
  }

  limpiar() {
    setState(() {
      result = 0;
      formKey.currentState?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, end: 10),
                      width: 120,
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Valor 1',
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          number1 = double.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ingrese un numero';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, end: 10),
                      width: 120,
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Valor 2',
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          number2 = double.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un numero';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: sumar,
                      child: const Text(
                        '+',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: restar,
                      child: const Text(
                        '-',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: multiplicar,
                      child: const Text(
                        '*',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: dividir,
                      child: const Text(
                        '/',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 220,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "Resultado: $result",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  onPressed: limpiar,
                  child: const Text(
                    'Limpiar',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
