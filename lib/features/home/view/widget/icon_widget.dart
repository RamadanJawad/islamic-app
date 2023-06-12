import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              width: 53.w,
              height: 53.h,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1.w),
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Image.asset(
                urlAsset,
                color: ColorCode.mainColor,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: "ibm",
                fontSize: 16.sp,
                overflow: TextOverflow.ellipsis,
                color: ColorCode.secondaryColor),
          )
        ],
      ),
    );
  }
}
