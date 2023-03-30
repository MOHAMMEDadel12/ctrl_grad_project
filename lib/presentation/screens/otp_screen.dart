
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/resources/app_string.dart';
import '../../core/theme/colors.dart';
import '../controller/cubit/auth/auth_cubit.dart';
import '../controller/cubit/auth/auth_state.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import 'change_pass.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Padding(
              padding: EdgeInsets.only(
                right: 15.0.w,
              ),
              child: Icon(
                Icons.cancel,
                color: black,
                size: 30,
              ),
            ),
          ),
          Text(
            '__',
            style: TextStyle(color: white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Verify',
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppStrings.otpDesc,
              style: TextStyle(
                  fontSize: 16.sp, color: Color.fromRGBO(134, 134, 134, 1)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 25.h),
              child: PinCodeTextField(
                controller: pinPutController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                keyboardType: TextInputType.phone,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: primaryColor,
                  disabledColor: white,
                  inactiveFillColor: white,
                  inactiveColor: secondColor,
                  selectedFillColor: secondColor,
                  selectedColor: secondColor,
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(20.r),
                  fieldHeight: 40.h,
                  fieldWidth: 40.w,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),

                enableActiveFill: true,
                //errorAnimationController: errorController,
                //controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<AuthCubit, AuthStates>(
              builder: (context, state) {
                return DefaultButton(
                  onPressed: () async {
                    // AuthCubit.get(context).verifyCode(
                    //     email: AuthCubit.get(context).registerModel!.data.email,
                    //     code: pinPutController.text);
                  },
                  btnColor: primaryColor,
                  textStyle: TextStyle(
                      color: white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700),
                  btnTitle: 'Verify code',
                );
              },
              listener: (context, state) {
                if (state is VerifyCodeSuccessState) {
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context)=>CreateNewPassword()
                 ));
                }
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: () {
                    // AuthCubit.get(context).forgetPassword(
                    //   email: AuthCubit.get(context).registerModel!.data.email,
                    // );
                  },
                  child: Text( 'Resend code?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                     )),
            ),
          ],
        ),
      ),
    );
  }
}
