import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/images_manager.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';

import '../controller/cubit/home/home_cubit.dart';
import '../controller/cubit/home/home_stste.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';
import 'feedback_screen.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<HomeApp> with TickerProviderStateMixin{

  bool switchState = false;
  bool isSelected = true;
  AnimationController? bottomSheetController;
  @override
  initState() {
    super.initState();
    bottomSheetController = BottomSheet.createAnimationController(this);
    bottomSheetController?.duration = const Duration(seconds: 1);
  }

  @override
  void dispose() {
    bottomSheetController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            drawer: Drawer(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(55.r))),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            child: Text('RA'),
                            backgroundColor: primaryColor,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            children: [
                              Text('Reham Asharf'),
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Text('Edit Profile')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Divider(
                      thickness: 1.w,
                    ),
                    SizedBox(height: 50.h),
                    ItemsDrawer(
                      icon: Icons.person_outline_outlined,
                      title: 'Profile Info',
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.profileInfoScreen);
                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.lock_reset_outlined,
                      title: 'Change Password',
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.changePassScreen);
                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.language,
                      title: 'Language',
                      onTap: () {
                        showModalBottomSheet(
                          transitionAnimationController: bottomSheetController,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: white,
                          barrierColor: Colors.red,
                          context: context,
                          builder: (context) => SizedBox(
                            height: 400.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 21.h,
                                ),
                                Container(
                                  height: 5.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(15.r)),
                                ),
                                SizedBox(
                                  height: 41.h,
                                ),
                                Text('Switch languages'
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Text("schose languages"),

                                SizedBox(
                                  height: 45.h,
                                ),
                                GestureDetector(
                                  onTap: () {

                                    // context
                                    //     .read<LanguageCubit>()
                                    //     .changeLanguage('ar');
                                    //
                                    // setState(() {
                                    //   isSelected = true;
                                    //   LanguageCacheHelper.saveIsSelected(
                                    //       isSelected);
                                    // });
                                    // Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 9.0.w),
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7.r)),
                                      color: isSelected
                                          ? const Color.fromRGBO(191, 76, 38, 0.18)
                                          : white,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 12.0.h),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/flag_eg.svg",
                                              height: 40.h,
                                            ),
                                            Padding(
                                              padding: true
                                                  ? EdgeInsets.only(left: 15.0.w)
                                                  : EdgeInsets.only(left: 0.0.w),
                                              child: Text(
                                                "En"
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // await context
                                    //     .read<LanguageCubit>()
                                    //     .changeLanguage('en');
                                    //
                                    // setState(() {
                                    //   isSelected = false;
                                    //   LanguageCacheHelper.saveIsSelected(
                                    //       isSelected);
                                    // });
                                    // Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 9.0.w),
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15.r)),
                                      color: isSelected
                                          ? white
                                          : Color.fromRGBO(191, 76, 38, 0.18),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 12.0.h),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/flag_en.svg",
                                              height: 40.h,
                                            ),
                                            Text(
                                              "Englsih"

                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.feedback,
                      title: 'Feedback',
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.feedbackScreen);
                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.info,
                      title: 'About us',
                      onTap: () {

                        Navigator.pushNamed(
                            context, AppRouter.aboutUsScreen);


                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.send_time_extension_rounded,
                      title: 'Contact us',
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.contactUsScreen);

                      },
                    ),
                    SizedBox(height: 29.h),
                    ItemsDrawer(
                      icon: Icons.login,
                      title: 'Log out',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(

                              contentPadding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 20),
                              actionsPadding: EdgeInsets.symmetric(horizontal: 20 , vertical : 30),

                              content: Text(
                                'Are you sure you would like to sign out from your account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w400),
                              ),
                              icon:  Icon(Icons.warning , color: primaryColor),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      child: DefaultButton(
                                        btnWidth: 200.0,

                                        btnTitle: "CANCEL",
                                        onPressed: () {},
                                        btnColor: primaryColor,

                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: DefaultButton(
                                        btnWidth: 200,
                                        btnTitle: "LOGOUT",
                                        onPressed: () {},
                                        btnColor: Colors.white,
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: primaryColor),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: white,
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: BottomNavigationBar(
                    elevation: 15,
                    unselectedItemColor: black,
                    currentIndex: cubit.currentIndex,
                    backgroundColor: Colors.blue.shade50,
                    selectedItemColor: primaryColor,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: true,
                    onTap: (index) {
                      setState(() {
                        cubit.currentIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(IconsAssets.home),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(IconsAssets.scan),
                          label: 'Scan'),
                      BottomNavigationBarItem(
                        label: 'History',
                        icon: SvgPicture.asset(IconsAssets.history),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemsDrawer extends StatelessWidget {
  var icon;
  var onTap;
  String title;

  ItemsDrawer({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.0.w),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              title,
              style: AppTheme.titleHeader.copyWith(
                  color: primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: primaryColor,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
