import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class HeaderQuestion extends StatelessWidget {
  final String number;
  const HeaderQuestion({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 25,
          ),
          onTap: () {
            Get.back();
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          number,
          style: TextStyle(
              fontFamily: "ibm",
              color: Colors.black,
              fontSize: 18.sp),
        ),
        const Spacer(),
        Text(
          SharedPrefController().getAllStarsPoint.toString(),
          style: TextStyle(
              fontFamily: "ibm",
              color: Colors.black,
              fontSize: 15.sp),
        ),
        SizedBox(
          width: 5.w,
        ),
        Image.asset(
          ImageUrl.dollar,
          width: 30.w,
          height: 30.h,
        )
      ],
    );
  }
}
