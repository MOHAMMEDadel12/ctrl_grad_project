import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/colors.dart';
class OrText extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return  SizedBox(
        width: double.infinity.w,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                height: 0.5.h,
                color: grey,
              ),
              Text(
                "  OR  ",
                style: TextStyle(color: primaryColor, fontSize: 20.sp),
              ),
              Container(
                width: 100.w,
                height: 0.5.h,
                color: grey,
              ),
            ],
          ),
        ),
      );
  }
}