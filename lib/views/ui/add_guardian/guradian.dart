import 'package:blessed_academy/utils/colors.dart';
import 'package:blessed_academy/utils/navigation/src/navigation.dart';
import 'package:blessed_academy/views/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/text_field.dart';
import '../../widgets/button.dart';
import '../home/BlessedHome.dart';

class AddGuardian extends StatelessWidget {
  const AddGuardian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        elevation: 0.00,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: kcBaseBlack,
        ),
        backgroundColor: kColorWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            TextView(
              text: 'Add a guardian',
              color: kcBaseBlack,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 31.h),
            TextView(
              text: 'Give access to another guardian',
              color: const Color(0xFF007AA0),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20),
            BlessedTextField(
              hintText: '91+9876543210',
              keyboardType: TextInputType.phone,
              label: 'Mobile',
              prefixIcon: const Icon(Icons.phone_android_rounded),
            ),
            SizedBox(height: 20.h),
            BlessedTextField(
              hintText: '91+9876543210',
              keyboardType: TextInputType.phone,
              label: 'Confirm Mobile',
              prefixIcon: const Icon(Icons.phone_android_rounded),
            ),
            SizedBox(height: 20.h),
            ButtonWidget(
              buttonText: 'Give Access',
              radius: 12,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 54.h,
              onPressed: () {
                navigate(context, const BlessedHome());
              },
              color: kColorWhite,
            ),
          ],
        ),
      ),
    );
  }
}
