import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/tasabih_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/view/widget/subha/my_pointer.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return SizedBox(
        width: 300.w,
        height: 300.h,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 280.w,
                height: 280.h,
                child: AnimatedBuilder(
                  animation: controller.animation,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: controller.animation.value * 0.5,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    ImageUrl.decoration,
                    color: ColorCode.mainColor,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 150.h,
                width: 150.w,
                child: CustomPaint(
                  foregroundPainter: MyPainter(
                      lineColor: ColorCode.mainColor.withOpacity(0),
                      completeColor: ColorCode.secondaryColor,
                      completePercent: controller.value,
                      width: 7.0.w),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor:
                                ColorCode.mainColor.withOpacity(0.5)),
                        child: Text(
                          "${controller.value}",
                          style:
                              TextStyle(fontFamily: "Cairo", fontSize: 25.sp),
                        ),
                        onPressed: () {
                          controller.checkPercent();
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
