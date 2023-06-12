import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/settings/controller/setting_controller.dart';
import 'package:islamic_app/features/settings/view/widget/about_widget.dart';
import 'package:islamic_app/features/settings/view/widget/alert_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SettingController>(SettingController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            "الاعدادات",
            style: TextStyle(fontFamily: "ibm", fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AlertWidget(),
                SizedBox(
                  height: 10.h,
                ),
                const AboutWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
