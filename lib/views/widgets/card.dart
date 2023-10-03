import 'package:blessed_academy/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../utils/helpers.dart';
import '../../utils/time_util.dart';
import 'images/image_place_holder.dart';
import 'textview.dart';

class CardWidget extends StatelessWidget {
  final Color? color;
  final String? image;
  final String? text;
  final String? subTitle;
  final Function()? onTap;

  const CardWidget(
      {Key? key,
      required this.color,
      required this.image,
      this.subTitle = '',
      required this.text,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Helpers.getDeviceWidth(context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: text!,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      textAlign: TextAlign.left,
                      color: kColorWhite,
                      maxLines: 4,
                    ),
                    SizedBox(height: 8.h),
                    TextView(
                      text: TimeUtil.formatDate(subTitle!),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      textAlign: TextAlign.left,
                      color: kColorWhite,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                height: Helpers.getDeviceHeight(context),
                fit: BoxFit.cover,
                imageUrl: image!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const ImagePlaceHolder(),
                errorWidget: (context, url, error) => const ImagePlaceHolder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
