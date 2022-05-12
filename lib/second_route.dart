import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  double number1 = 0;
  double number2 = 0;
  double result = 0;
  int _value = 1;

  final formKey = GlobalKey<FormState>();
  calcular() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {        
        if (_value == 1) {
          result = (number1 + number2) ;
        }
        if (_value == 2) {
          result = (number1 - number2);
        }
        if (_value == 3) {
          result = (number1 * number2);
        }
        if (_value == 4) {
          result = number1 / number2;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero 1',
                    ),
                    onSaved: (value) {
                      number1 = double.parse(value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese un numero';
                      }
                      return null;
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero 2',
                    ),
                    onSaved: (value) {
                      number2 = double.parse(value!) ;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese un numero';
                      }
                      return null;
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const Text(
                    'Seleccione Operador',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ListTile(
                    title: const Text(
                      'Suma',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<int>(
                      groupValue: _value,
                      value: 1,
                      activeColor: const Color(0xFF6200EE),
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Resta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<int>(
                      groupValue: _value,
                      value: 2,
                      activeColor: const Color(0xFF6200EE),
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Multiplicación',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<int>(
                      groupValue: _value,
                      value: 3,
                      activeColor: const Color(0xFF6200EE),
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'División',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<int>(
                      groupValue: _value,
                      value: 4,
                      activeColor: const Color(0xFF6200EE),
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                   Text(
                    'Resultado: $result',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: calcular,
                    child: const Text(
                      'Calcular',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
