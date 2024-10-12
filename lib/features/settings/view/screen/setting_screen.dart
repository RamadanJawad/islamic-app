import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
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
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            ManagerStrings.setting,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.black),
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
                  height: ManagerHeight.h10,
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
