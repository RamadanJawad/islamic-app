import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/functions/pray_time.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (SharedPrefController().latitude == null) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else {
        check(controller);
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r),
          child: Container(
            width: double.infinity,
            height: 160.h,
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    ImageUrl.decoration,
                    width: double.infinity,
                    color: const Color(0xffA17E3C),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Image.asset(
                        ImageUrl.icon,
                        width: 23.w,
                        height: 23.h,
                      ),
                      Text("الصلاة القادمة",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Cairo",
                              color: ColorCode.secondaryColor)),
                    ]),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset(controller.image,
                                  width: 25.w, height: 25.h),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${controller.currentPray}",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "Tajawal",
                                    color: ColorCode.secondaryColor),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${controller.prayTime}",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "Tajawal",
                                    color: ColorCode.secondaryColor),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            indent: 6,
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "باقي على صلاة ",
                                    style: TextStyle(
                                        color: ColorCode.secondaryColor,
                                        fontFamily: "Cairo",
                                        fontSize: 19.sp)),
                                TextSpan(
                                  text: controller.currentPray,
                                  style: TextStyle(
                                      color: ColorCode.mainColor,
                                      fontFamily: "Cairo",
                                      fontSize: 19.sp),
                                )
                              ])),
                              SizedBox(
                                height: 5.h,
                              ),
                              StreamBuilder(
                                  stream: Stream.periodic(
                                      const Duration(seconds: 1)),
                                  builder: (context, snapshot) {
                                    return Text(
                                      controller.dateTime
                                          .difference(DateTime.now())
                                          .toString()
                                          .split('.')[0],
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: "Tajawal",
                                          color: Colors.black),
                                    );
                                  }),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
