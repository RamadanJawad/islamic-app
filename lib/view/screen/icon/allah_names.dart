import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/allahNames_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/icon/body_allahname.dart';

class AllahNames extends StatelessWidget {
  const AllahNames({super.key});
  @override
  Widget build(BuildContext context) {
    AllahNamesController controller = Get.put(AllahNamesController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorCode.mainColor,
            title: Text(
              "أسماء الله الحسنى",
              style: TextStyle(fontFamily: "Cairo", fontSize: 22.sp),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(10),
            child: const AllahName(),
          )),
    );
  }
}
