import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/hadith_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/icon/body_hadith.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithController controller = Get.put(HadithController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          title: Text(
            "الاحاديث النبوية",
            style: TextStyle(fontFamily: "Cairo", fontSize: 22.sp),
          ),
        ),
        body: const BodyHadith(),
      ),
    );
  }
}
