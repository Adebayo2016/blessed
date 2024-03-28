import 'package:blessed_academy/utils/colors.dart';
import 'package:blessed_academy/views/ui/home/courseCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/drop_down_textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentHour = int.parse(DateFormat('H').format(now));

    String timeOfDay = getTimeOfDay(currentHour);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // stacked the round design on the whole container
          Stack(
            children: [
              // main container
              Container(
                // height: 192.h,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(13.w, 13.h, 13.h, 26.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFc8a655),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(23.w, 30.h, 28.w, 27.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Hello,\n',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                // height: 0.05,
                              ),
                              children: [
                                TextSpan(
                                    text: timeOfDay,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      // height: 0.07,
                                    )),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 41.h,
                            width: 41.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: const Icon(
                              Icons.notifications_sharp,
                              color: kColorWhite,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 35.h),



                      // SizedBox(
                      //   height: 44.h,
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       fillColor: kColorWhite,
                      //       filled: true,
                      //       prefixIcon: const Icon(Icons.search, size: 20),
                      //       // suffix: HomeDropdownBtn(
                      //       //   width: 43.w,
                      //       // ),
                      //       hintText: 'Search',
                      //       hintStyle: TextStyle(
                      //         color: const Color(0xFFB7B7B7),
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400,
                      //         fontFamily: GoogleFonts.inter().fontFamily,
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderSide: const BorderSide(color: kColorWhite),
                      //         borderRadius: BorderRadius.circular(100),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/Circle.svg"),
            ],
          ),

          Row(
            children: [
              const SizedBox(width: 30),
              Text(
                'Explore categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                'See all',
                style: TextStyle(
                  color: kColorMainPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                children: [
                CourseCard(title: "UTME", image: "assets/icons/jb.png",),
                  CourseCard(title: "post UTME", image: "assets/icons/jb.png",)
                ],

              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                children: [
                CourseCard(title: "Waec", image: "assets/icons/wae.png",),
                  CourseCard(title: "Neco", image: "assets/icons/nec.png",)
                ],

              ),
            ],
          )

        ],
      ),
    );
  }

  String getTimeOfDay(int hour) {
    if (hour >= 0 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }
}
