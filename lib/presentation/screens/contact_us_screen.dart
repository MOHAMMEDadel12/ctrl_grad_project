import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../controller/cubit/profile/profile_cubit.dart';
import '../controller/cubit/profile/profile_states.dart';
import '../widgets/components/components.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ContactUsSuccessState) {
          // CacheHelper.saveData(key: 'userId', value: state.loginModel.customer!.id.toString());
          //  isUser=true;
          // userId = state.loginModel.customer!.id.toString();
          showToast(message: state.feedback!.message!, status: ToastStatus.success);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.app,
                (route) => false,
          );
        }


      },
      builder: (context, state) {
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
                'Contact Us',
                style: AppTheme.titleHeader.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 39.h,
                    ),
                    Text(
                      'Leave us a message, we will get contact \nwith you as soon as possible',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        // hintStyle: TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 14,
                        //     color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      controller: nameController ,
                      onChanged: (value) {
                        setState(() {
                          nameController.text = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {
                          emailController.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Your Email",

                        // hintStyle: TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 14,
                        //     color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextFormField(
                      controller: messageController,
                      onChanged: (value) {
                        setState(() {
                          messageController.text = value;
                        });
                      },
                      minLines: 7,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Leave a message...",
                        // hintStyle: TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 14,
                        //     color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 77,
                    ),
                    ConditionalBuilder(
                      condition: state is! ContactUsLoadingState,
                      builder: (context) =>
                          DefaultButton(
                            btnTitle: "SEND",
                            onPressed: () {

                            ProfileCubit.get(context).postContactUs(name:nameController.text, email: emailController.text, message: messageController.text);
                            },
                            btnColor: primaryColor,
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                      fallback: (context) => CircularProgressIndicator(),

                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
