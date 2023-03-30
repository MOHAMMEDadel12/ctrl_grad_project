import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';




import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../controller/cubit/auth/auth_cubit.dart';
import '../controller/cubit/auth/auth_state.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import 'forget_password.dart';
class CreateNewPassword extends StatefulWidget {
  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  bool isObscureNewPass = true;
  bool isObscureConNewPass = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create new password',style: AppTheme.titleHeader,),
                  SizedBox(height: 40.h,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty';
                      } else if (value.length < 8) {
                        return 'Must be at least 8 characters';
                      }
                    },
                    controller: newPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscureNewPass,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(200, 220, 230, 1.0),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.white.withOpacity(0)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.white.withOpacity(0)),
                      ),

                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscureNewPass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscureNewPass = !isObscureNewPass;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty';
                      } else if (value.length < 8) {
                        return 'Must be at least 8 characters';
                      }
                      else if(value!=newPasswordController.text)
                        {
                          return 'The passwords do not match';
                        }
                    },
                    controller: confirmNewPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscureConNewPass,
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(200, 220, 230, 1.0),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.white.withOpacity(0)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.white.withOpacity(0)),
                      ),

                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscureConNewPass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscureConNewPass = !isObscureConNewPass;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  BlocConsumer<AuthCubit, AuthStates>(
                    builder: (context, state) {
                      return DefaultButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate())
                            {
                              AuthCubit.get(context).resetPassword(
                                email: ForgetPasswordScreen.emailController.text,
                                password: newPasswordController.text
                              );
                            }
                        },
                        btnColor: primaryColor,
                        textStyle: TextStyle(
                            color: white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                        btnTitle: 'Reset password',
                      );
                    },
                    listener: (context, state) {
                      if (state is ResetPasswordSuccessState) {
                     //   displayToastMessage(context, state.resetPasswordModel!.message);
                      }
                    },
                  ),
                ],
              ),
            )
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
