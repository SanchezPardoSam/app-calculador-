import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CalcButton extends StatelessWidget {
  final String text;
  final int colorText;
  final int backgroundColor;
  final double textSize;
  final Function callBack;

  // ignore: use_key_in_widget_constructors
  const CalcButton(
    {required this.callBack,
    this.text="",
    this.backgroundColor = 0,     
    this.colorText = 0xFFFFFFFF,
    this.textSize = 28}    
  );
  @override
  Widget build(BuildContext context) {    
    
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () {
            callBack(text);
          }, 
          child:  Text(text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize
              )
            ),
          ),    
          style: TextButton.styleFrom(   
            primary: Color(colorText),     
            // ignore: unnecessary_null_comparison
            backgroundColor: backgroundColor != null ? Color(backgroundColor) : null,
            shape: RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(50)
            ),
            
          ),
        ),
      ),
    );
  }
}
