import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/view/widget/quran/display_quran.dart';

QuranController controller = Get.put(QuranController());
alertDialog() {
  if (SharedPrefController().nameQuran != null &&
      SharedPrefController().currentSurah != null) {
    Get.defaultDialog(
        title: "تنبيه",
        titleStyle: TextStyle(fontFamily: "Cairo", fontSize: 17.sp),
        middleText: "هل تريد استكمال القراءة من اخر صفحة تم قراءتها ؟",
        middleTextStyle: TextStyle(fontFamily: "Cairo", fontSize: 17.sp),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => DisplayQuran(
                      name: SharedPrefController().nameQuran,
                      number: SharedPrefController().currentSurah,
                    ));
                Future.delayed(Duration(seconds: 1), () {
                  controller.pageController.animateToPage(
                      SharedPrefController().currentPage!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCode.mainColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  foregroundColor: Colors.white),
              child: Text(
                "نعم",
                style: TextStyle(fontFamily: "Cairo", fontSize: 15.sp),
              )),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                  side: BorderSide(color: ColorCode.mainColor, width: 1.w),
                  foregroundColor: Colors.black),
              child: Text(
                "لا",
                style: TextStyle(fontFamily: "Cairo", fontSize: 15.sp),
              ))
        ]);
  }
}
