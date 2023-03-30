import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import 'edit_profile_screen.dart';
class ChangePasswordScreen extends StatelessWidget {
var currentPasswordController=TextEditingController();
var newPasswordController=TextEditingController();
var confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: white,
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
          'Change Password',
          style: AppTheme.titleHeader.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body:
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90.h,),
              TextFormFiledInfoUser(
                hasWidget: false,
                title: 'Current Password',
                controller: currentPasswordController,
              ),
              SizedBox(height: 32.h,),
              TextFormFiledInfoUser(
                hasWidget: false,
                title: 'New Password',
                controller: newPasswordController,
              ),
              SizedBox(height: 32.h,),
              TextFormFiledInfoUser(
                hasWidget: false,
                title: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              SizedBox(height: 50.h,),
              DefaultButton(
                btnTitle: 'CHANGE PASSWORD',
                onPressed: (){},
                textStyle: AppTheme.btnStyleActive.copyWith(fontSize: 15.sp),
                btnColor: primaryColor,
              ),
              SizedBox(height: 30.h,),

            ],
          ),
        ),
      ),
    );
  }
}
