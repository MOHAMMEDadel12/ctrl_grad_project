import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';


class DefaultTextFormFiled extends StatelessWidget {
  var validator;
  var controller;
  var icon;
  String? hintText;
  DefaultTextFormFiled(
      {this.validator, required this.controller, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.descBlack,
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
          borderSide: BorderSide(color: Colors.white.withOpacity(0)),
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.black,
                size: 20,
              )
            : null,
      ),
    );
  }
}
