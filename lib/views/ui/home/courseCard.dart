import 'package:blessed_academy/utils/colors.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {

  final String title;
  final String? image;
  const CourseCard({super.key, required this.title,  this.image});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:kCBoxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 5,),
          Image(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            image:AssetImage(widget.image!),
          ),
          Text(widget.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}
