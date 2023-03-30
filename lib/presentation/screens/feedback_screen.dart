import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../controller/cubit/profile/profile_cubit.dart';
import '../controller/cubit/profile/profile_states.dart';
import '../widgets/components/components.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var messageController = TextEditingController();
  double initialRating = 2;

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
          'Feedback',
          style: AppTheme.titleHeader.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is FeedbackSuccessState) {
            // CacheHelper.saveData(key: 'userId', value: state.loginModel.customer!.id.toString());
            //  isUser=true;
            // userId = state.loginModel.customer!.id.toString();
            showToast(message: state.feedback!.message!, status: ToastStatus.success);

          }

        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Rate Your Experience',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Feel free to share your feedback with us',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  RatingBar.builder(
                    initialRating: initialRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        initialRating = rating;
                      });
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 20.0,
                      dashColor: Colors.grey,
                      dashRadius: 0.0,
                      dashGapLength: 10.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tell us What can be improved?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormField(
                        controller: messageController,
                        minLines: 7,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "Tell us how can we improve ...",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            messageController.text = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  ConditionalBuilder(
                    condition: state is! FeedbackLoadingState,
                    builder: (context) =>
                        DefaultButton(
                          btnTitle: 'SUBMIT',
                          onPressed: () async {
                             ProfileCubit.get(context)
                                .postFeedback(
                                message: messageController.text,
                                rate: initialRating);
                          },
                          btnColor: primaryColor,
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                    fallback: (context) => CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
