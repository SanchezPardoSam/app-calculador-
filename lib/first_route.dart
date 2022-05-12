import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework_calculador/widgets/listButton.dart';
import 'package:math_expressions/math_expressions.dart';

class FirstRoute extends StatefulWidget {
  FirstRoute({Key? key}) : super(key: key);

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
    String _history = "";
  String _expression = "";
  bool clearText = false;

  void numClick(String text) {
    setState(() {
      _expression = clearText ? _expression = text : _expression += text;
      clearText = false;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
      clearText = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 24, color: Color(0xFF545F61))),
              ),
              alignment: const Alignment(1, 1),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 48, color: Color(0XFFFFFFFF))),
              ),
              alignment: const Alignment(1, 1),
            ),
            const SizedBox(
              height: 40,
            ),
            // ignore: todo
            // TODO: AC C % /
            ListButton(allClear, clear, numClick, evaluate),
          ],
        ),
      ),
    );
  }
}