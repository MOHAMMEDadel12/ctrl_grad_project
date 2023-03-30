import 'package:flutter/material.dart';

import 'onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with
    SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation <double>_animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.repeat();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()));
      // if (prefs!.getBool(Constant.haveSeenBefore) == true) {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => const LoginOrSignUpScreen()));
      // } else {
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => OnBoardingScreen()));
      // }
    });
    super.initState();
  }
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: ScaleTransition(
         scale: _animation,
         child: Center(
           child: Image.asset('assets/images/SplashScreen.gif',
             width: MediaQuery.of(context).size.width*0.8,),
         ),
       )
    );
  }
}
