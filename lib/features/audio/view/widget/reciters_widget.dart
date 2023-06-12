import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class RecitersWidget extends StatelessWidget {
  const RecitersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return SizedBox(
        height: 120.h,
        child: ListView.builder(
            itemCount: Data.reciters.length,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 75.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                      color: controller.selectItem == index
                          ? ColorCode.mainColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15).r),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10).r,
                        child: Image.asset(
                          Data.reciters[index]['image'],
                          width: 50.w,
                          fit: BoxFit.cover,
                          height: 50.h,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Data.reciters[index]['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "ibm",
                            fontSize: 13.5.sp,
                            color: controller.selectItem == index
                                ? Colors.white
                                : Colors.black),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
