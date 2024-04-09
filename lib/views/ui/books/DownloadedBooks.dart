import 'package:blessed_academy/DataHandlers/HomeController.dart';
import 'package:blessed_academy/utils/colors.dart';
import 'package:blessed_academy/views/ui/books/OpenPdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/courseDisplay.dart';
import 'allBooksDisplay.dart';
import 'allDownloadedBooksDisplay.dart';



class DownloadedBooks extends StatefulWidget {
  const DownloadedBooks({super.key});

  @override
  State<DownloadedBooks> createState() => _DownloadedBooksState();
}

class _DownloadedBooksState extends State<DownloadedBooks> {
  final HomeController _ctr = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _ctr
                .downloadedCourses.isEmpty?
            const Center(
                child: Text('No courses Downloaded yet')
            ):ListView.builder(
                shrinkWrap: true,
                itemCount: _ctr.downloadedCourses.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                      await _ctr.setSelectDownloadedCourse(_ctr.downloadedCourses[index]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: _ctr.downloadedCourses[index]['path'],
                            name: _ctr.downloadedCourses[index]['name'],),
                        ),
                      );
                      },
                      child: AllDownloadedBooksDisplay(
                        CoursesDisplay: _ctr.downloadedCourses[index],));
                }),
          ),
        ));
  }

}
