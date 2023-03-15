import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class BodyPrayTime extends StatelessWidget {
  const BodyPrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.fajr,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة الفجر",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.fajr)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.sunrise,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة الشروق",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.sunrise)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.dhuhr,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة الظهر",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.dhuhr)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.asr,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة العصر",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.asr)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.maghrib,
                  width: 30.w,
                  height: 30.h,
                ),
                 SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة المغرب",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.maghrib)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageUrl.isha,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                 Text(
                  "صلاة العشاء",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "${DateFormat.jm().format(controller.prayerTimes.isha)}",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
