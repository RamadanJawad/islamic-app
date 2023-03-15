import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/athkar_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/athkar/body_athkart.dart';

class AthkarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AthkarController controller = Get.put(AthkarController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorCode.mainColor,
            title: Text(
              "الاذكار",
              style: TextStyle(fontFamily: "Cairo", fontSize: 22.sp),
            ),
          ),
          body: const BodyAthkar()),
    );
  }
}
