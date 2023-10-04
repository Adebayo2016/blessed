import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/helpers.dart';
import 'images/svg_helper.dart';
import 'textview.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? primary;
  final Color? borderColor;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final double? elevation;
  final String? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.borderColor,
    this.iconColor,
    this.height,
    this.width,
    this.fontSize = 16.0,
    this.icon,
    this.elevation = .0,
    this.radius = 8,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.primary,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width ?? Helpers.getDeviceWidth(context),
        height: height ?? 56.0.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(

              // primary: primary ?? Pallets.red,
              elevation: elevation,
              backgroundColor: primary ?? kColorMainPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!)),
              side: BorderSide(color: borderColor ?? kColorMainPrimary)),
          onPressed: onPressed,
          child: icon == null
              ? TextView(
                  text: buttonText,
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp,
                  color: color ?? kColorWhite,
                  textAlign: textAlign,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    TextView(
                      text: buttonText,
                      fontWeight: fontWeight,
                      fontSize: fontSize.sp,
                      color: color ?? kColorWhite,
                      textAlign: textAlign,
                    ),
                    const Spacer(),
                    SvgHelperImage(image: icon, color: iconColor, height: 16.h),
                    SizedBox(width: 19.w),
                  ],
                ),
        ),
      ),
    );
  }
}
