import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/tasabih_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/subha/body_widget.dart';
import 'package:islamic_app/view/widget/subha/custom_point.dart';
import 'package:islamic_app/view/widget/subha/number_head.dart';

class SubhaScreen extends StatelessWidget {
  const SubhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.lazyPut(() => TasabihController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            "المسبحة الالكترونية",
            style: TextStyle(fontFamily: "Cairo", fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const NumberHead(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const BodyWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const CustomPoint()
                ],
              )),
        ),
      ),
    );
  }
}
