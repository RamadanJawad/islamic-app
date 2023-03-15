import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/constant/color.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key, required this.urlAsset, required this.name, this.onPressed});

  final String urlAsset;
  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              width: 60.w,
              height: 60.h,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.w),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                urlAsset,
                color: ColorCode.mainColor,
              ),
            ),
          ),
          Text(
            name,
            style:  TextStyle(
                fontFamily: "Cairo",
                fontSize: 16.sp,
                overflow: TextOverflow.ellipsis,
                color: ColorCode.secondaryColor),
          )
        ],
      ),
    );
  }
}
