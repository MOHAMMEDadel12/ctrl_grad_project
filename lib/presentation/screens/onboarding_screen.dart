import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../../data/model/onboarding_item.dart';
import 'onboarding_content.dart';
import 'welcome_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();
  @override
  void initState() {
   // prefs!.setBool(Constant.haveSeenBefore, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget buildDot(int index) {
      return AnimatedContainer(
        duration: const Duration(microseconds: 200),
        height: 10,
        width: index == currentIndex ? 40 : 10,
        child: Container(
          height: 10,
          width: 40,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? const Color(0xff5B94C2)
                : const Color(0xffb5c1df),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity:
                currentIndex!=0? 1:0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex--;
                        controller.animateToPage(currentIndex,
                            duration: const Duration(microseconds: 100),
                            curve: Curves.elasticIn);
                      });
                    },
                    icon: const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff5B94C2),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity:
                  currentIndex != Constant.boardingItems.length - 1 ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppRouter.welcome);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0xff5B94C2),
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),


              ],
            ),

            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SplashContent(Constant.boardingItems[index]);
                },
                itemCount: Constant.boardingItems.length,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          Constant.boardingItems.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildDot(index),
                              )))
                ],
              ),
            ),
            currentIndex == Constant.boardingItems.length - 1
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CupertinoButton(
                      color: const Color(0xff5B94C2),
                      child: const Text('Get Started'),
                      onPressed: ()
                      {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const WelcomeScreen()));
                      }),
                )
                : CupertinoButton(
                    child:  CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                        controller.animateToPage(currentIndex,
                            duration: const Duration(microseconds: 100),
                            curve: Curves.elasticIn);
                      });
                    }),
             SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
