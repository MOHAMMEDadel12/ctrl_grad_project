import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';


class ProfileInfoScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Profile Info',
          style: AppTheme.titleHeader.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.editProfile);

              },
              icon: Icon(
                Icons.edit,
                color: primaryColor,
                size: 18,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            CircleAvatar(
              radius: 30.r,
              child: Text('RA'),
              backgroundColor: primaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('@Reham'),
            SizedBox(height: 33.h),
            TextFormFiledInfoUser(
              controller: firstNameController,
              title: 'First Name',
              hasWidget: false,
            ),
            SizedBox(height: 17.h),
            TextFormFiledInfoUser(
              controller: lastNameController,
              title: 'Last Name',
              hasWidget: false,
            ),
            SizedBox(height: 17.h),
            TextFormFiledInfoUser(
              controller: emailController,
              title: 'Email',
              hasWidget: false,
            ),
            SizedBox(height: 17.h),
            TextFormFiledInfoUser(
              controller: dobController,
              title: '27/11/2000',
              hasWidget: false,
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                Expanded(
                  child: TextFormFiledInfoUser(
                      controller: dobController,
                      title: 'Male',
                      hasWidget: true),
                ),
                Expanded(
                  child: TextFormFiledInfoUser(
                      controller: dobController,
                      title: 'Female',
                      hasWidget: true),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                Expanded(
                  child: TextFormFiledInfoUser(
                      controller: dobController,
                      title: 'Teacher',
                      hasWidget: true),
                ),
                Expanded(
                  child: TextFormFiledInfoUser(
                      controller: dobController,
                      title: 'Student',
                      hasWidget: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormFiledInfoUser extends StatelessWidget {
  TextFormFiledInfoUser({
    Key? key,
    required this.controller,
    required this.title,
    required this.hasWidget,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  bool hasWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      //shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: primaryColor, width: 0.5.w)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: false,
                controller: controller,
                readOnly: true,
                //cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                // style:TextStyle(color:Get.isDarkMode?colorWhite: colorBlack),
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                    hintText: title,
                    hintStyle: AppTheme.descBlack.copyWith(fontSize: 15.sp),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: hasWidget
                        ? Icon(
                            Icons.circle,
                            color: primaryColor,
                          )
                        : null),
              ),
            ),
            //widget?? Container()
          ],
        ),
      ),
    );
  }
}
