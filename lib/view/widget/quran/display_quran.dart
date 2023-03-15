import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';

class DisplayQuran extends StatelessWidget {
  final int? number;
  final String? name;
  const DisplayQuran({
    super.key,
    this.number,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(builder: (controller) {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: ColorCode.mainColor)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: PageView.builder(
                              controller: controller.pageController,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (val) {
                                SharedPrefController().savePage(index: val);
                                controller.currentIndex = val;
                              },
                              itemCount:
                                  controller.getSurahPages(number!).length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الجزء:${controller.juz}",
                                          style: const TextStyle(
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${name}",
                                          style: const TextStyle(
                                              fontFamily: "Cairo",
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Center(
                                        child: Text(
                                      index == 0 ? name! : "",
                                      style: TextStyle(
                                          fontSize: 23.sp,
                                          fontFamily: "Tajawal"),
                                    )),
                                    if (name != "سورة التوبة" &&
                                        name != "سورة الفاتحة") ...{
                                      if (index == 0) ...{
                                        SvgPicture.asset(
                                          ImageUrl.basmalah,
                                          color: ColorCode.mainColor,
                                          width: 200.w,
                                        ),
                                      }
                                    },
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          controller
                                              .getVersesTextByPage(
                                                  Data.surahPage[number! - 1] +
                                                      index,
                                                  number!)
                                              .join(" ")
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: controller.size,
                                              fontFamily: "Uthman"),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "رقم الصفحة:${Data.surahPage[number! - 1] + index}",
                                      style: TextStyle(fontFamily: "Cairo"),
                                    ),
                                  ],
                                );
                              })),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
