import 'package:flutter/material.dart';

class FourthRoute extends StatefulWidget {
  FourthRoute({Key? key}) : super(key: key);

  @override
  State<FourthRoute> createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  final formKey = GlobalKey<FormState>();
  double number1 = 0;
  double number2 = 0;
  double sum = 0, rest = 0, mult = 0, div = 0, result = 0;
  bool value1 = false, value2 = false, value3 = false, value4 = false;
  String select = "Sumar";
  List listItem = ['Sumar', 'Restar', 'Multiplicar', 'Dividir'];
  operacion2() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        if (select == "Sumar") {
          result = number1 + number2;
        } else if (select == "Restar") {
          result = number1 - number2;
        } else if (select == "Multiplicar") {
          result = number1 * number2;
        } else if (select == "Dividir") {
          result = number1 / number2;
        }
      });
    }
  }

  operacion() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        if (value1) {
          sum = number1 + number2;
        }
        if (value2) {
          rest = number1 - number2;
        }
        if (value3) {
          mult = number1 * number2;
        }
        if (value4) {
          div = number1 / number2;
        }
        if (!value1) {
          sum = 0;
        }
        if (!value2) {
          rest = 0;
        }
        if (!value3) {
          mult = 0;
        }
        if (!value4) {
          div = 0;
        }
      });
    }
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
                CheckboxListTile(
                  activeColor: Colors.red,
                  title: const Text("Sumar"),
                  value: value1,
                  onChanged: (val) {
                    setState(() {
                      value1 = val!;
                      operacion();
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  title: const Text("Restar"),
                  value: value2,
                  onChanged: (val) {
                    setState(() {
                      value2 = val!;
                      operacion();
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  title: const Text("Dividir"),
                  value: value3,
                  onChanged: (val) {
                    setState(() {
                      value3 = val!;
                      operacion();
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.red,
                  title: const Text("Multiplicar"),
                  value: value4,
                  onChanged: (val) {
                    setState(() {
                      value4 = val!;
                      operacion();
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 250,
                  height: 150,
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
                    "Resultado\n Suma: $sum \n Resta: $rest \n Multiplicacion: $mult \n Division: $div",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      const Text(
                        "Seleccione la operacion",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        hint: const Text("Seleccione"),
                        value: select,
           
                        onChanged: (newValue) {
                          setState(() {
                            select = newValue!;
                            operacion2();
                          });
                        },
                        items: listItem.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Text("Resultado: $result",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
