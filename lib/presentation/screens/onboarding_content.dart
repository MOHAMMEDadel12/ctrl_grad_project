import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/onboarding_item.dart';





class SplashContent extends StatelessWidget {
  const SplashContent(this.item, {Key? key}) : super(key: key);
  final OnBoardingItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              item.image,
              height: 250.h,
              width: 250.w,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                item.description!,
                style:  TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
             SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
