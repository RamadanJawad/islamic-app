import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/pray_time.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimeController>(
      builder: (controller) {
        check(controller);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r10)),
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("باقي لصلاة ${controller.currentPray}",
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.mainColor)),
                  Row(
                    children: [
                      StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          return Text(
                            controller.dateTime
                                .difference(DateTime.now())
                                .toString()
                                .split('.')[0],
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s24,
                                color: ManagerColors.mainColor),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    controller.hijri!,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s15,
                        color: ManagerColors.black),
                  ),
                ],
              ),
              Image.asset(
                controller.image,
                width: ManagerWidth.w70,
                height: ManagerHeight.h70,
              ),
            ],
          ),
        );
      },
    );
  }
}
