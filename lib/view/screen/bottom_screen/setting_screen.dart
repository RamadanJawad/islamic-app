import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/setting_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/settings/about_widget.dart';
import 'package:islamic_app/view/widget/settings/alert_widget.dart';
import 'package:islamic_app/view/widget/settings/mode_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            "الاعدادات",
            style: TextStyle(fontFamily: "Cairo", fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(6),
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
