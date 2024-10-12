import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/hadeas/controller/hadith_controller.dart';
import 'package:islamic_app/features/hadeas/view/widget/body_hadith.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HadithController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            "الاحاديث النبوية",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22, color: ManagerColors.black),
          ),
        ),
        body: const BodyHadith(),
      ),
    );
  }
}
