import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import '../../core/resources/app_string.dart';
import '../../core/theme/colors.dart';
import '../controller/cubit/auth/auth_cubit.dart';
import '../controller/cubit/auth/auth_state.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import 'otp_screen.dart';


class ForgetPasswordScreen extends StatelessWidget {
  static var  emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [secondryColor, Colors.white],
        ),
      ),
      child: Scaffold(
          backgroundColor: colorTransparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.forgetPass,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppStrings.forgetPassDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp, color: Color.fromRGBO(134, 134, 134, 1)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value!.isEmpty
                      ? 'Enter Your Email'
                      : EmailValidator.validate(value)
                          ? null
                          : "please enter valid  email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: secondryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0)),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    return DefaultButton(
                      onPressed: () async {
                        await AuthCubit.get(context).forgetPassword(
                          email: emailController.text,
                        );
                      },
                      btnColor: primaryColor,
                      textStyle: TextStyle(
                          color: white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                      btnTitle: 'Submit',
                    );
                  },
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccessState) {
                      // displayToastMessage(
                      //     context, state.forgetPasswordModel!.message);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }

  // displayToastMessage(BuildContext context, String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_LONG,
  //     textColor: white,
  //     backgroundColor: grey,
  //   );
  // }
}
