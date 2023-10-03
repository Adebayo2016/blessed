import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePlaceHolder extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final String? image; 

  const ImagePlaceHolder(
      {Key? key, this.height = 89, this.radius = 8, this.width = 89, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!.r),
          color: Colors.grey[200]),
      height: height!.h,
      width: width!.w,
      child: Image.asset(
        image!,
      ),
    );
  }
}
