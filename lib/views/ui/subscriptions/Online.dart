import 'package:blessed_academy/DataHandlers/HomeController.dart';
import 'package:blessed_academy/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/courseDisplay.dart';
import 'allOnlineDisplay.dart';



class OnlineSubs extends StatefulWidget {
  const OnlineSubs({super.key});

  @override
  State<OnlineSubs> createState() => _OnlineSubsState();
}

class _OnlineSubsState extends State<OnlineSubs> {
  final HomeController _ctr = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _ctr
                .onlineCoursesSubscription.isEmpty?
            const Center(
                child: Text('No courses subscribed yet')
            ):ListView.builder(
                shrinkWrap: true,
                itemCount: _ctr.onlineCoursesSubscription.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                        await _ctr.setSelectedOnlineSubscription(_ctr.onlineCoursesSubscription[index]);
                        // Get.bottomSheet(
                        //     Container(
                        //       height: 500.h,
                        //       //color: Colors.white,
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.only(
                        //             topLeft: Radius.circular(20),
                        //             topRight: Radius.circular(20),
                        //           )
                        //       ),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             const SizedBox(height: 20,),
                        //             Row(
                        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //               children: [
                        //                 Container(
                        //                     height: 100.h,
                        //                     child: Image.asset('assets/icons/pdficon.png')),
                        //                 Column(
                        //                   children: [
                        //                     Text(_ctr.selectedOnlineCourse?['course_name']),
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //             const SizedBox(height: 20,),
                        //             Text('Course Description',
                        //               style: TextStyle(
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold
                        //               ),
                        //             ),
                        //             SizedBox(height: 10.h,),
                        //             Text(_ctr.selectedOnlineCourse!['end_date']),
                        //             InkWell(
                        //               onTap: (){
                        //                 _ctr.downloadSelectedPurchasedCourse();
                        //               },
                        //               child: Container(
                        //                 width: double.infinity,
                        //                 height: 50.h,
                        //                 decoration: BoxDecoration(
                        //                     color: kCBoxColor,
                        //                     borderRadius: BorderRadius.circular(10)
                        //                 ),
                        //                 child: Center(
                        //                   child: Text('Download course',
                        //                     style: TextStyle(
                        //                         color: Colors.white,
                        //                         fontSize: 20,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //
                        //           ],
                        //         ),
                        //       ),
                        //     )
                        // );

                      },
                      child: AllOnlineCourseDisplay(
                        CoursesDisplay: _ctr.onlineCoursesSubscription[index],));

                }),
          ),
        ));
  }
}
