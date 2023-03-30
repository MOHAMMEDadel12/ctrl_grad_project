import 'package:camera/camera.dart';
import 'package:ctrl_graduation_project/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:ctrl_graduation_project/presentation/controller/cubit/home/home_cubit.dart';
import 'package:ctrl_graduation_project/presentation/controller/cubit/language/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/local_network/cashe_helper.dart';
import 'core/services/remote_network/dio_helper.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constance.dart';
import 'presentation/controller/cubit/profile/profile_cubit.dart';
import 'presentation/controller/cubit/scan/scan_cubit.dart';

// List<CameraDescription> cameras = [];
SharedPreferences? prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // final firstCamera = cameras.first;
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();


  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  MyApp({required this.appRouter});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => ScanCubit()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (c, i) => MaterialApp(
          // locale: state.locale,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
              child: widget!,
            );
          },
          onGenerateRoute: widget.appRouter.generateRoute,
          initialRoute: AppRouter.splash,
          title: AppConstant.appNameEn,
          debugShowCheckedModeBanner: false,
            // home: HomeScreen(),
          // localizationsDelegates: const [
          //   AppLocale.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const [Locale('en'), Locale('ar')],
          // localeResolutionCallback: (locale, supportedLocales) {
          //   for (final supportedLocale in supportedLocales) {
          //     if (supportedLocale.languageCode == locale?.languageCode) {
          //       return supportedLocale;
          //     }
          //   }
          //   return supportedLocales.first;
          // },
        ),
      ),
    );
  }
}
