import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/prayTime_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/icon/body_callender.dart';
import 'package:islamic_app/view/widget/icon/body_prayTime.dart';

class PrayTimeScreen extends StatelessWidget {
  const PrayTimeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    PrayTimeController controller = Get.put(PrayTimeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          // automaticallyImplyLeading: false,//الغاء زر الرجوع
          title: Text(
            "أوقات الصلاة",
            style: TextStyle(fontFamily: "Cairo", fontSize: 22.sp),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            const BodyCalender(),
            SizedBox(height: 10.h),
            const BodyPrayTime()
          ],
        ),
      ),
    );
  }
}
