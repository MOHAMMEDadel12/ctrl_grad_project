import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: white,
        title: Text(
          'About Us',
          style: AppTheme.titleHeader.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 56.h,
              ),
              Text(
                "SQ App helps you find the correct answer or the closest to the right one. ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "SQ App helps you find the correct answer or the closest to the right one. ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "The higher the percentage, the greater the probability that the answer will be correct. ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              SizedBox(
                height: 70.h,
              ),
              SvgPicture.asset(
                'assets/images/about_us.svg',
                semanticsLabel: 'A shark?!',
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
