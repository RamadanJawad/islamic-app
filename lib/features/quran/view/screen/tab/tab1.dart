import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/data/data.dart';
import 'package:pdfx/pdfx.dart';

class Tab1Screen extends StatelessWidget {
  final PdfControllerPinch controllerPinch;
  const Tab1Screen({super.key, required this.controllerPinch});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return AnimationLimiter(
          child: ListView.builder(
            itemCount: Data().surahs.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                        int indexPage = Data.surahNumberPage[index] - 1;
                        controllerPinch.jumpToPage(indexPage);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Data.revelationType[index] == "مكية"
                              ? Colors.grey.withOpacity(0.2)
                              : ColorCode.mainColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/vector.png",
                                  width: 40.w,
                                  height: 40.h,
                                  color: ColorCode.mainColor,
                                ),
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      fontSize: 14.sp, fontFamily: "ibm"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(Data().surahs[index],
                                style: TextStyle(
                                    fontFamily: "ibm", fontSize: 18.sp)),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  Data.revelationType[index],
                                  style: TextStyle(
                                      fontFamily: "ibm",
                                      fontSize: 15.sp,
                                      color: Colors.grey),
                                ),
                                Text(
                                  "آية:${Data.ayahOfSurah[index]}",
                                  style: TextStyle(
                                      fontFamily: "ibm",
                                      fontSize: 15.sp,
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
