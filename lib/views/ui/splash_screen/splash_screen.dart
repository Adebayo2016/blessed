import 'package:blessed_academy/utils/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/textview.dart';
import '../add_guardian/guradian.dart';

class BlessedSplashScreen extends StatelessWidget {
  const BlessedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboard.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 2,
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
            ButtonWidget(
              buttonText: 'Get Started',
              radius: 12,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 54.h,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              icon: 'assets/icons/arrow_right.svg',
              iconColor: kColorWhite,
              onPressed: () {
                navigate(context, const AddGuardian());
              },
              color: kColorWhite,
            ),
            // SizedBox(height: 38.h),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
