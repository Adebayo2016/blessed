import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgHelperImage extends StatelessWidget {
  final String? image;
  final Color? color;
  final double? height;
  final double? width;

  const SvgHelperImage(
      {Key? key,
      required this.image,
      this.color,
      this.height = 20,
      this.width = 20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image!,
      // ignore: prefer_if_null_operators
      color: color,
      height: height!.h,
      width: width!.w,
    );
  }
}
