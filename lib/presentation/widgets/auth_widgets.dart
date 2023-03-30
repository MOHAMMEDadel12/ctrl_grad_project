import 'package:flutter/material.dart';

Widget authFormField({
  required conteoller ,
  required TextInputType textInputType ,
  required String lebelText ,

})=>TextFormField(
  controller: conteoller,
  keyboardType: textInputType,
  decoration: InputDecoration(
    labelText: lebelText,
    labelStyle: TextStyle(color: Colors.black),
    filled: true,
    fillColor: Color.fromRGBO(200, 220, 230, 1.0),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:
      BorderSide(color: Colors.white.withOpacity(0)),
    ),
    prefixIcon: Icon(
      Icons.email_outlined,
      color: Colors.black,
      size: 20,
    ),
  ),
);