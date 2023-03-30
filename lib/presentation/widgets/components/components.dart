
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

void showToast({required String message, required ToastStatus status}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(status),
        textColor: Colors.white,
        fontSize: 16.sp);

enum ToastStatus { success, error, waring }
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
Color? chooseToastColor(ToastStatus status) {
  Color? color;
  switch (status) {
    case ToastStatus.success:
      color = primaryColor;
      break;
    case ToastStatus.waring:
      color = Colors.orange;
      break;
    case ToastStatus.error:
      color = Colors.red;
      break;
  }
  return color;
}