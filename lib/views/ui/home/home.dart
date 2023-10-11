import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                height: 192.h,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(13.w, 13.h, 13.h, 26.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF008CAF),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(23.w, 41.h, 28.w, 27.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // const Column(
                      //   children: [
                      //     Text('Hello'),
                      //     Text('data'),
                      //   ],
                      // ),
                      RichText(
                        text: const TextSpan(
                          text: 'Hello\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            // height: 0.05,
                          ),
                          children: [
                            TextSpan(
                                text: 'Good Morning ',
                                style: TextStyle(
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
                        child: const Text('d'),
                      )
                    ],
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/Circle.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
