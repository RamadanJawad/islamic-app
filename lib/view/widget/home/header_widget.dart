import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/view/screen/icon/allah_names.dart';
import 'package:islamic_app/view/screen/icon/athkar_screen.dart';
import 'package:islamic_app/view/screen/icon/hadith_screen.dart';
import 'package:islamic_app/view/screen/icon/pray_time_screen.dart';
import 'package:islamic_app/view/screen/icon/qibla_screen.dart';
import 'package:islamic_app/view/widget/home/icon_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
              color: ColorCode.mainColor,
              gradient: const LinearGradient(
                  colors: [ColorCode.mainColor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30).r,
                  bottomRight: const Radius.circular(30).r)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
          child: Opacity(
            opacity: 0.6,
            child: Image.asset(ImageUrl.mosque),
          ),
        ),
        Card(
          elevation: 2,
          margin: const EdgeInsets.only(top: 120, left: 5, right: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25).r),
          child: Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25).r, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageUrl.icon,
                        width: 25.w,
                        height: 25.h,
                      ),
                      Text(
                        "الاختصارات",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 18.sp,
                            color: ColorCode.secondaryColor),
                      )
                    ],
                  ),
                  const Divider(
                    endIndent: 6,
                    indent: 6,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      IconWidget(
                        urlAsset: ImageUrl.allah,
                        name: "اسماء الله",
                        onPressed: () {
                          Get.to(() => AllahNames(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.athkar,
                        name: "الاذكار",
                        onPressed: () {
                          Get.to(() => AthkarScreen(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.hadeas,
                        name: "الاحاديث",
                        onPressed: () {
                          Get.to(() => HadithScreen(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.qibla,
                        name: "القبلة",
                        onPressed: () {
                          Get.to(() => QiblaScreen(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.pray_time,
                        name: "اوقات الصلاة",
                        onPressed: () {
                          Get.to(() => PrayTimeScreen(),
                              transition: Transition.fadeIn);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
