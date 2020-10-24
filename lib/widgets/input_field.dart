import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextInputType Type;
  final int max;
  final Function validador;
  final double size;
  InputField({this.icon, this.hint, this.obscure, this.Type, this.max, this.validador, this.size});



  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 10, left: 20, right: 30, bottom: 0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
        maxLength: 11,
        maxLengthEnforced: true,
        decoration: InputDecoration(
            icon: Icon(icon, color: Colors.blueGrey),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: size),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[100])),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[100])),
            contentPadding:
                EdgeInsets.only(left: 5, right: 10, bottom: 10, top: 5)),
        style: TextStyle(color: Colors.grey),
        obscureText: obscure,
        keyboardType: Type,
        validator: validador,
        ),
      );
  }
}



