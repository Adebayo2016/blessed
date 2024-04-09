import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../DataHandlers/HomeController.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/courseDisplay.dart';

class JambCourses extends StatefulWidget {
  const JambCourses({super.key});

  @override
  State<JambCourses> createState() => _JambCoursesState();
}

class _JambCoursesState extends State<JambCourses> {
  final HomeController _ctr = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
                child: _ctr.jambCourses.isEmpty
                    ? const Center(child: Text('No courses available'))
                    : ListView.builder(
                        itemCount: _ctr.jambCourses.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () async {
                                await _ctr.setCurrentCourse(_ctr.jambCourses[index]);
                                Get.bottomSheet(
                                    Container(
                                      height: 500.h,
                                      //color: Colors.white,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: 100.h,
                                                    child: Image.asset('assets/icons/pdficon.png')),
                                                Column(
                                                  children: [
                                                    Text(_ctr.currentCourse['name']),
                                                    Text('Price :${_ctr.currentCourse['price']}')
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 20,),
                                            Text('Course Description',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Text(_ctr.currentCourse['desc']),
                                            InkWell(
                                              onTap: (){
                                                _ctr.BuyCourse(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                    color: kCBoxColor,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Center(
                                                  child: Text('Buy Course',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    )
                                );

                              },
                              child: CourseDisplay(
                                CoursesDisplay: _ctr.jambCourses[index],));
                        }))));
  }
}
