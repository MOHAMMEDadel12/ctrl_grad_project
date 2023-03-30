import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/colors.dart';

class DefaultTextFiled extends StatelessWidget {
  final TextInputType keyboardType;
  final String? labelText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  Widget? widget;
  var onTap;
  var onChanged;
  var onFieldSubmitted;
  var validate;
  InputBorder? border;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  BorderSide? borderSide;
  bool? filled;
  bool? readOnly;
  Color? fillColor;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? hintStyle;
  int? maxLength;
  int? minLines;
  String? hintText;
  DefaultTextFiled(
      {required this.keyboardType,
        this.prefixIcon ,
        this.labelText,
        this.suffixIcon,
        this.obscureText,
        this.controller,
        this.widget,
        this.onTap,
        this.onChanged,
        this.onFieldSubmitted,
        this.validate,
        this.border,
        this.enabledBorder,
        this.focusedBorder,
        this.fillColor,
        this.filled,
        this.borderSide,
        this.maxLength,
        this.inputFormatters,
        this.minLines,
        this.hintText,
        this.hintStyle,
        required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            minLines: minLines,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validate,
            onTap: onTap,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            readOnly: readOnly!,
            controller: controller,
            obscureText: obscureText ?? false,
            cursorColor: black,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Color.fromRGBO(200, 220, 230, 1.0),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                BorderSide(color: Colors.white.withOpacity(0)),
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.black,
                size: 20,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        widget ?? Container()
      ],
    );
  }
// String validateName(String? value) {
//   if (value!.isEmpty) return 'Username is Required.';
//
//   return value;
// }
}
