import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/data/data.dart';
import 'package:share_plus/share_plus.dart';

class AyhaWidget extends StatelessWidget {
  const AyhaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10).r),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      ImageUrl.decoration,
                      width: double.infinity,
                      height: 120.h,
                      color: ColorCode.mainColor,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageUrl.icon,
                            width: 23.w,
                            height: 23.h,
                          ),
                          Text("أية وعبرة",
                              style: TextStyle(
                                fontFamily: "ibm",
                                fontSize: 18.sp,
                                color: ColorCode.secondaryColor,
                                fontWeight: FontWeight.w400,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        "${controller.ayha(controller.currentPage)}\n ${controller.tafseer(controller.currentPage)}"));
                                Get.snackbar(
                                  "",
                                  "تم نسخ النص بنجاح",
                                  margin: EdgeInsets.all(10),
                                  snackStyle: SnackStyle.FLOATING,
                                  titleText: Text(
                                    "*ملاحظة",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "ibm",
                                        fontSize: 18.sp,
                                        color: ColorCode.mainColor),
                                  ),
                                  messageText: Text(
                                    "تم نسخ النص بنجاح",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "ibm", fontSize: 17.sp),
                                  ),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              icon: const Icon(
                                Icons.copy,
                                color: Colors.grey,
                              )),
                          IconButton(
                              onPressed: () async {
                                await Share.share(
                                    controller.share(controller.currentPage));
                              },
                              icon: const Icon(
                                Icons.share,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 100.h,
                        child: PageView.builder(
                          scrollBehavior: const ScrollBehavior(),
                          controller: controller.pageController,
                          onPageChanged: (index) {
                            controller.onPageChange(index);
                          },
                          itemCount: Data.ayah.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 7.h,
                                ),
                                Center(
                                  child: Text(
                                    "۞ ${controller.ayha(index)} ۞",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "ibm",
                                        fontSize: 18.sp,
                                        color: ColorCode.secondaryColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Center(
                                  child: Text(
                                    controller.tafseer(index),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "ibm",
                                        fontSize: 17.sp,
                                        color: ColorCode.mainColor),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            Data.ayah.length,
                            (index) => AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              duration: const Duration(milliseconds: 400),
                              width:
                                  controller.currentPage == index ? 25.w : 6.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color: controller.currentPage == index
                                      ? ColorCode.mainColor
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10).r),
                            ),
                          ),
                        ],
                      ),
                    ],
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
