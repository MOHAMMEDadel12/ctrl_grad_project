import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import '../../core/resources/app_validate.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';

import '../controller/cubit/auth/auth_cubit.dart';
import '../controller/cubit/auth/auth_state.dart';
import '../controller/cubit/scan/scan_cubit.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text_from_filed.dart';
import '../widgets/or_text.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  // displayToastMessage(BuildContext context, String message) {
  //   Fluttertoast.showToast(msg: message.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(200, 220, 230, 1.0), Colors.white]),
      ),
      child: Scaffold(
        backgroundColor: colorTransparent,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: BlocBuilder<AuthCubit,AuthStates>(
                  builder: (context,state){
                    return BlocConsumer<AuthCubit,AuthStates>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          // CacheHelper.saveData(key: 'userId', value: state.loginModel.customer!.id.toString());
                          //  isUser=true;
                          // userId = state.loginModel.customer!.id.toString();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouter.app,
                                (route) => false,
                          );
                        }

                      } ,
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome back!',
                              style: AppTheme.titleHeader,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Login to your account and start enjoyed new features',
                              style: AppTheme.descBlack,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            DefaultTextFiled(
                              controller: emailController,
                              labelText: ' Email Address',
                              prefixIcon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              readOnly: false,
                              validate: (value) =>
                                  AppValidate.validateEmail(value, context),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            DefaultTextFiled(
                              prefixIcon: Icons.password,
                              labelText: "Password",
                              readOnly: false,
                              validate: (value) =>
                                  AppValidate.validatePassword(
                                      value, context),
                              controller: passwordController,
                              obscureText: !_passwordVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRouter.forgetPassword);
                                  },
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ConditionalBuilder(
                              builder: (context)=> DefaultButton(
                                btnTitle: 'Login',
                                textStyle: AppTheme.btnStyleActive,
                                btnColor: primaryColor,
                                btnWidth: 280.w,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );



                                  }
                                },
                              ),
                              fallback: (context)=>Center(child: CircularProgressIndicator(),),
                              condition: state is ! LoginLoadingState ,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            OrText(),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/facebook.png',
                                      height: 35,
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/google.png',
                                      height: 35,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have an Account?",
                                  style: TextStyle(
                                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                  onPressed: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const SignUpScreen()));
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(91, 148, 194, 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        );

                      },
                    );
                  },

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


