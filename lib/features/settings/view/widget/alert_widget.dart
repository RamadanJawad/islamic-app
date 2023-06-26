import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/settings/controller/setting_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/settings/view/widget/switch_button.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: ColorCode.mainColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "التنبيهات",
              style: TextStyle(
                  fontFamily: "ibm",
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ImageUrl.notification1,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "تنبيهات الصلاة",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value1,
                  onChangeMethod: (value) {
                    controller.onChange1(value);
                    SharedPrefController().saveStatus1(status1: value);
                    controller.prayTimeNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ImageUrl.notification2,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "تنبيهات أذكار الصباح",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value2,
                  onChangeMethod: (value) {
                    controller.onChange2(value);
                    SharedPrefController().saveStatus2(status2: value);
                    controller.morningNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ImageUrl.notification3,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "تنبيهات أذكار المساء",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value3,
                  onChangeMethod: (value) {
                    controller.onChange3(value);
                    SharedPrefController().saveStatus3(status3: value);
                    controller.nightNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ImageUrl.notification4,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "تنبيهات يوم الجمعة",
                  style: TextStyle(
                      fontFamily: "ibm",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value4,
                  onChangeMethod: (value) {
                    controller.onChange4(value);
                    SharedPrefController().saveStatus4(status4: value);
                    controller.fridayNotification();
                  },
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      );
    });
  }
}
