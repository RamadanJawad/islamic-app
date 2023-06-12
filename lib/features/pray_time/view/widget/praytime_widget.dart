import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/functions/pray_time.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';
import 'package:islamic_app/routes/routes.dart';

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimeController>(
      builder: (controller) {
        check(controller);
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.pray_time);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "صلاة ${controller.currentPray}",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: "ibm",
                                color: ColorCode.mainColor),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            controller.prayTime,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: "ibm",
                                color: ColorCode.secondaryColor),
                          ),
                        ],
                      ),
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
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontFamily: "ibm",
                                    color: ColorCode.mainColor),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "باقي",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "ibm",
                                color: ColorCode.secondaryColor),
                          ),
                        ],
                      ),
                      Text(
                        controller.hijri!,
                        style: const TextStyle(fontFamily: "ibm"),
                      ),
                    ],
                  ),
                  Image.asset(
                    controller.image,
                    width: 75.w,
                    height: 75.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
