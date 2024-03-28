import 'dart:async';

import 'package:blessed_academy/utils/navigation/navigation.dart';
import 'package:blessed_academy/views/ui/Authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/textview.dart';
import '../add_guardian/guradian.dart';
import '../home/BlessedHome.dart';

class BlessedSplashScreen extends StatefulWidget {
  const BlessedSplashScreen({super.key});

  @override
  State<BlessedSplashScreen> createState() => _BlessedSplashScreenState();
}

class _BlessedSplashScreenState extends State<BlessedSplashScreen> {

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300.h,
                width: 200.w,
                child: Image.asset(
                  'assets/ble.png',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                 // height: MediaQuery.sizeOf(context).height / 2,
                ),
              ),
            ),
            SizedBox(height: 26.h),
            TextView(
              text: 'Welcome to\nBLESSED ACADEMY',
              textAlign: TextAlign.center,
              color: kcBaseBlack,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 47.h),
            TextView(
              text: '''
            Your Ultimate Lifelong Learning
            Companion! Blessed Academy
            empowers you to explore, grow, and
            excel on your journey of lifelong learning.
            ''',
              color: kColorGray500,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26.h),
            // ButtonWidget(
            //   buttonText: 'Get Started',
            //   radius: 12,
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.w600,
            //   height: 54.h,
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   icon: 'assets/icons/arrow_right.svg',
            //   iconColor: kColorWhite,
            //   onPressed: () {
            //     navigate(context, const BlessedHome());
            //   },
            //   color: kColorWhite,
            // ),
            // SizedBox(height: 38.h),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      //navigateReplace(context, const TabLayout());
      print(timer.tick.toString());

      if (timer.tick == 1) {
        setState(() {
          _visible = true;
        });
      }
      if (timer.tick == 2) {
        FirebaseAuth.instance.userChanges().listen((User? user) {
          if (user == null) {
            navigateReplace(context, const Login());
          } else {
            navigateReplace(context, const BlessedHome());
          }
        });
        timer.cancel();
      }

    });

  }
}
