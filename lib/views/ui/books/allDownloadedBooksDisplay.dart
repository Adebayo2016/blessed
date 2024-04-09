import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDownloadedBooksDisplay extends StatelessWidget {

  final Map? CoursesDisplay;
  const AllDownloadedBooksDisplay({super.key, this.CoursesDisplay});
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // height: 70.h,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset('assets/icons/pdficon.png'),
                  // height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Text(CoursesDisplay!['name']),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 5.h,)
      ],
    );
  }
}
