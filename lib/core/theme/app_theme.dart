import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';


class AppTheme{
  static TextStyle get btnStyleActive{
    return TextStyle(
        color: lightWhite,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp
    );
  }
  static TextStyle get btnStyleNonActive{
    return TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp
    );
  }
  static TextStyle get chelaOneFont{
    return TextStyle(
        fontSize: 38.sp,
        fontFamily: 'ChelaOne',
        fontWeight: FontWeight.w600,
        color: secondColor
    );
  }
  static TextStyle get titleHeader{
    return TextStyle(
        fontSize: 20.sp,
        fontFamily: 'ChelaOne',
        fontWeight: FontWeight.w600,
        color: black
    );
  }
  static TextStyle get desc{
    return TextStyle(
        fontSize: 20.sp,
        fontFamily: 'ChelaOne',
        fontWeight: FontWeight.w300,
        color: secondColor,
    );
  }
  static TextStyle get descBlack{
    return TextStyle(
      fontSize: 13.sp,
      fontFamily: 'ChelaOne',
      fontWeight: FontWeight.w500,
      color: black,
    );
  }
}