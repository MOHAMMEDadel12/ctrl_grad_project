import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';




class DefaultButton extends StatelessWidget {
  double? borderRaduis;
  double? btnWidth;
  Color? btnColor;
  String btnTitle;
  TextStyle? textStyle;
  BoxBorder? btnBorder;
  var icon;
  var onPressed;
  DefaultButton(
      {this.borderRaduis,
      this.btnColor,
      this.btnWidth,
      this.onPressed,
      required this.btnTitle,
      this.textStyle,
      this.btnBorder,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: btnBorder ??
            Border.all(
              color: primaryColor,
            ),
        borderRadius: BorderRadius.circular(borderRaduis ?? 18.r),
        color: btnColor,
      ),
      width: btnWidth ?? 320.w,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          btnTitle,
          style: textStyle,
        ),
      ),
    );
  }
}
