import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/languages/app_local.dart';
import '../../core/resources/app_string.dart';
import '../../core/resources/app_validate.dart';
import '../../core/resources/images_manager.dart';
import '../../core/theme/colors.dart';

import '../../core/utils/app_router.dart';
import '../controller/cubit/auth/auth_cubit.dart';
import '../controller/cubit/auth/auth_state.dart';
import '../widgets/default_form_field.dart';
import '../widgets/or_text.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [secondryColor, white])),
        child: Scaffold(
            backgroundColor: colorTransparent,
            body: BlocConsumer<AuthCubit, AuthStates>(
              builder: (context, state) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          AppStrings.createAccount,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: DefaultTextFiled(
                                controller: firstNameController,
                                labelText: 'First Name',
                                prefixIcon: Icons.person,
                                keyboardType: TextInputType.emailAddress,
                                validate: (value) =>
                                    AppValidate.validateName(value, context),                                readOnly: false,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: DefaultTextFiled(
                                controller: lastNameController,
                                labelText: 'Last Name',
                                prefixIcon: Icons.person,
                                keyboardType: TextInputType.emailAddress,
                                readOnly: false,
                                validate: (value) =>
                                    AppValidate.validateName(value, context),

                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        DefaultTextFiled(
                          controller: usernameController,
                          labelText: 'Username',
                          prefixIcon: Icons.account_circle,
                          keyboardType: TextInputType.text,
                          readOnly: false,
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
                        SizedBox(
                          height: 30.h,
                        ),
                        DefaultTextFiled(
                          prefixIcon: Icons.password,
                          labelText: "Confirm Password",
                          readOnly: false,
                          validate: (value) =>
                              AppValidate.validateConfirmPassword(value , passwordController , confirmPasswordController , context),
                          controller: confirmPasswordController,
                          obscureText: !_confirmPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible =
                                !_confirmPasswordVisible;
                              });
                            },
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Color.fromRGBO(91, 148, 194, 1),
                            ),
                            width: 180,
                            child: MaterialButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {

                                  AuthCubit.get(context).userRegister(
                                    userName: usernameController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    gender: "Male",

                                  );

                                  // SaveObjectUser.save(
                                  //   streetAddress: '',
                                  //   region: '',
                                  //   landMark: '',
                                  //   floor: '',
                                  //   building: '',
                                  //   city: '',
                                  //   phone: '',
                                  //   email: emailController.text,
                                  //   lastName: '',
                                  //   firstName: '',
                                  // );

                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        OrText(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: secondryColor,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.facebook)),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            CircleAvatar(
                              backgroundColor: secondryColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(IconsAssets.google),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(91, 148, 194, 1),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  // CacheHelper.saveData(key: 'userId', value: state.loginModel.customer!.id.toString());
                  //  isUser=true;
                  // userId = state.loginModel.customer!.id.toString();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.login,
                        (route) => false,
                  );
                }
              },
            )));
  }
}