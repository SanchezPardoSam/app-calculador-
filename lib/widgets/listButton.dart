
import 'package:flutter/material.dart';
import 'package:homework_calculador/widgets/CalculatorButton.dart';

class ListButton extends StatefulWidget {
  Function allClear, clear, numClick, evaluate;
  ListButton(this.allClear, this.clear, this.numClick, this.evaluate,{Key? key}) : super(key: key);

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              text: "AC",
              backgroundColor: 0xFF6C807F,
              textSize: 20,
              callBack: widget.allClear,
            ),
            CalcButton(
              text: "C",
              backgroundColor: 0xFF6C807F,
              callBack: widget.clear,
            ),
            CalcButton(
              text: "%",
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "/",
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
              callBack: widget.numClick,
            ),
          ],
        ),
        // ignore: todo
        // TODO: 7 8 9 *
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              text: "7",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "8",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "9",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "*",
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
              textSize: 30,
              callBack: widget.numClick,
            ),
          ],
        ),
        // ignore: todo
        // TODO: 4 5 6 -
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              text: "4",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "5",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "6",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "-",
              callBack: widget.numClick,
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
              textSize: 38,
            ),
          ],
        ),
        // ignore: todo
        // TODO: 1 2 3 +
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              text: "1",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "2",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "3",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "+",
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
              textSize: 30,
              callBack: widget.numClick,
            ),
          ],
        ),
        // ignore: todo
        // TODO: . 0 00 =
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              text: ".",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "0",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "00",
              callBack: widget.numClick,
            ),
            CalcButton(
              text: "=",
              callBack: widget.evaluate,
              backgroundColor: 0xFFFFFFFF,
              colorText: 0XFF65BDAC,
            ),
          ],
        ),
      ],
    );
  }
}
