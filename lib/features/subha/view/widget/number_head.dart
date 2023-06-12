import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';
import 'package:islamic_app/core/constant/color.dart';

class NumberHead extends StatelessWidget {
  const NumberHead({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "الدور",
                    style: TextStyle(fontSize: 20.sp, fontFamily: "ibm"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        border:
                            Border.all(width: 1.w, color: ColorCode.mainColor)),
                    child: Text(
                      "${controller.role}",
                      style: TextStyle(
                          fontFamily: "ibm",
                          fontSize: 25.sp,
                          color: ColorCode.secondaryColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "الاجمالي",
                    style: TextStyle(fontSize: 20.sp, fontFamily: "ibm"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 80.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        border:
                            Border.all(width: 1.w, color: ColorCode.mainColor)),
                    child: Text(
                      "${controller.value}",
                      style: TextStyle(
                          fontFamily: "ibm",
                          fontSize: 25.sp,
                          color: ColorCode.secondaryColor),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );
    });
  }
}
