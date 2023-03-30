import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scan Question', style: AppTheme.chelaOneFont)
                .animate(delay: 1000.ms)
                .fadeIn(delay: 500.ms),
            SizedBox(
              height: 13.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Text(
                  'Your scan journey start with us Sign in to continue',
                  style: AppTheme.desc,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            DefaultButton(
                    btnTitle: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.login);
                    },
                    btnColor: primaryColor,
                    textStyle: AppTheme.btnStyleActive)
                .animate()
                .fadeIn(delay: 500.ms, duration: 1000.ms)
                .then()
                .slide(duration: 400.ms)
                .then(delay: 200.ms)
                .move(delay: 0.ms),
            SizedBox(
              height: 30.h,
            ),
            DefaultButton(
              btnTitle: 'Sign Up',
              textStyle: AppTheme.btnStyleNonActive,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.register);
              },
            ).animate(),
          ],
        ),
      ),
    );
  }
}
