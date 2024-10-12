import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';
import 'package:islamic_app/features/subha/view/widget/my_pointer.dart';

class CustomPoint extends StatelessWidget {
  const CustomPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return SizedBox(
        width: ManagerWidth.w300,
        height: ManagerHeight.h300,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: ManagerWidth.w280,
                height: ManagerHeight.h280,
                child: AnimatedBuilder(
                  animation: controller.animation!,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: controller.animation!.value * 0.5,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    ManagerAssets.decoration,
                    color: ManagerColors.mainColor,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: ManagerWidth.w150,
                height: ManagerHeight.h150,
                child: CustomPaint(
                  foregroundPainter: MyPainter(
                      lineColor: ManagerColors.mainColor,
                      completeColor: Colors.black54,
                      completePercent: controller.value,
                      width: ManagerWidth.w8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor:
                                ManagerColors.mainColor.withOpacity(0.5)),
                        child: Text(
                          "${controller.value}",
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s24,
                              color: ManagerColors.white),
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
