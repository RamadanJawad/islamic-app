import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';

class CustomPrayTime extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  final String prayTimeName;
  final String prayTime;
  final String text1;
  final String text2;
  final bool isTapped;
  const CustomPrayTime({
    Key? key,
    this.onTap,
    required this.imagePath,
    required this.prayTimeName,
    required this.prayTime,
    required this.text1,
    required this.text2,
    required this.isTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10).r,
            highlightColor: Colors.white,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              height: isTapped ? 80.h : 65.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: Colors.grey, width: 1.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        prayTimeName,
                        style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                      ),
                      const Spacer(),
                      Text(
                        prayTime,
                        style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      isTapped ? text1 : text2,
                      style: const TextStyle(
                        fontFamily: "ibm",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
