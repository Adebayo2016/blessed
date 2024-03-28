import 'package:blessed_academy/views/ui/Authentication/login.dart';
import 'package:blessed_academy/views/ui/Authentication/sign_up.dart';
import 'package:blessed_academy/views/ui/home/BlessedHome.dart';
import 'package:blessed_academy/views/ui/home/home.dart';
import 'package:blessed_academy/views/ui/home/request_tutor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/ui/splash_screen/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform

  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder:EasyLoading.init(),
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: blessedAcademyTheme(context),
          home: BlessedSplashScreen(),
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45
    ..radius = 10
    ..progressColor = Color(0xFF00B1FF)
    ..backgroundColor =  Color(0xFF00B1FF)
    ..indicatorColor =  Color(0xFF00B1FF)
    ..textColor =  Color(0xFF00B1FF)
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}




