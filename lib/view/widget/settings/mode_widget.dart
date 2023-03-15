import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/setting_controller.dart';
import 'package:islamic_app/core/constant/color.dart';

class ModeWidget extends StatelessWidget {
  const ModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorCode.mainColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "اعدادات الخط",
              style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(),
            Center(
              child: Text(
                "بسم الله الرحمن الرحيم",
                style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: controller.fontSize.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.mainColor),
                    onPressed: () {
                      controller.largeText();
                    },
                    child: Icon(Icons.text_increase_rounded)),
                SizedBox(
                  width: 10.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.mainColor),
                    onPressed: () {
                      controller.smallText();
                    },
                    child: Icon(Icons.text_decrease_rounded))
              ],
            )
          ],
        ),
      );
    });
  }
}
