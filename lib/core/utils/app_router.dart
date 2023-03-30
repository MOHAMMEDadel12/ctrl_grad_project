import 'package:flutter/material.dart';

import '../../presentation/screens/about_us.dart';
import '../../presentation/screens/change_password_screen.dart';
import '../../presentation/screens/contact_us_screen.dart';
import '../../presentation/screens/edit_profile_screen.dart';
import '../../presentation/screens/feedback_screen.dart';
import '../../presentation/screens/forget_password.dart';
import '../../presentation/screens/home_app.dart';
import '../../presentation/screens/login.dart';
import '../../presentation/screens/profile_info_scrssn.dart';
import '../../presentation/screens/sign_up.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/welcome_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String forgetPassword = 'forgetPassword';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String changePassScreen = '/changePassScreen';
  static const String editProfile = '/editProfile';
  static const String profileInfoScreen = '/profileInfoScreen';
  static const String feedbackScreen = '/feedbackScreen';
  static const String contactUsScreen = '/contactUsScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String app = '/app';

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case profileInfoScreen:
        return MaterialPageRoute(builder: (_) => ProfileInfoScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case changePassScreen:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case feedbackScreen:
        return MaterialPageRoute(builder: (_) => FeedbackScreen());
      case contactUsScreen:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      case aboutUsScreen:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case app:
        return MaterialPageRoute(builder: (_) => HomeApp());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('AppText.noRouteFound'),
        ),
        body: Center(
          child: Text('AppText.noRouteFound'),
        ),
      ),
    );
  }
}
