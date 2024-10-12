import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            height: isTapped ? ManagerHeight.h80 : ManagerHeight.h60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              border: Border.all(
                  color: const Color(0xffF1EEE5), width: ManagerWidth.w1),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              highlightColor: ManagerColors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        width: ManagerWidth.w30,
                        height: ManagerHeight.h30,
                      ),
                      SizedBox(
                        width: ManagerWidth.w6,
                      ),
                      Text(
                        prayTimeName,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.black),
                      ),
                      const Spacer(),
                      Text(
                        prayTime,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      isTapped ? text1 : text2,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s13,
                        color: ManagerColors.black,
                        overflow: TextOverflow.fade,
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
