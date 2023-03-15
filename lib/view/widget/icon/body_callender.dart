import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/prayTime_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/data/data.dart';

class BodyCalender extends StatelessWidget {
  const BodyCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimeController>(builder: (controller) {
      return Container(
          height: 110.h,
          child: Container(
              child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 3.w);
            },
            itemCount: 365,
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  
                  controller.onClick(index);
                },
                child: Container(
                  height: 80.h,
                  width: 60.w,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorCode.mainColor),
                      borderRadius: BorderRadius.circular(8).r,
                      color: controller.currentDateSelectedIndex == index
                          ? ColorCode.mainColor
                          : Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Data.listOfMonths[DateTime.now()
                                    .add(Duration(days: index))
                                    .month -
                                1]
                            .toString(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Cairo",
                            color: controller.currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                       SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        DateTime.now()
                            .add(Duration(days: index))
                            .day
                            .toString(),
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: controller.currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                       SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        Data.listOfDays[DateTime.now()
                                    .add(Duration(days: index))
                                    .weekday -
                                1]
                            .toString(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Cairo",
                            color: controller.currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          )));
    });
  }
}
