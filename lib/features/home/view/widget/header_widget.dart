import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/features/home/view/widget/icon_widget.dart';
import 'package:islamic_app/features/qibla/view/screen/qibla_screen.dart';
import 'package:islamic_app/features/quran/view/screen/quran_screen.dart';
import 'package:islamic_app/features/settings/view/screen/setting_screen.dart';
import 'package:islamic_app/features/subha/view/screen/subha_screen.dart';
import 'package:islamic_app/routes/routes.dart';
import 'package:pdfx/pdfx.dart';

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
              gradient: const LinearGradient(colors: [
                ColorCode.mainColor,
                Colors.white,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30).r,
                  bottomRight: const Radius.circular(30).r)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
          child: Opacity(
            opacity: 0.6,
            child: Image.asset(ImageUrl.mosque),
          ),
        ),
        Card(
          elevation: 2,
          margin:
              const EdgeInsets.only(top: 120, left: 10, right: 10, bottom: 3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20).r,
                  topRight: const Radius.circular(20).r,
                  bottomLeft: const Radius.circular(5).r,
                  bottomRight: const Radius.circular(5).r)),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20).r,
                  topRight: const Radius.circular(20).r,
                  bottomLeft: const Radius.circular(5).r,
                  bottomRight: const Radius.circular(5).r),
            ),
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
                            fontFamily: "ibm",
                            fontSize: 19.sp,
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
                        urlAsset: ImageUrl.quran,
                        name: "القرآن",
                        onPressed: () {
                          final controller = PdfControllerPinch(
                            document:
                                PdfDocument.openAsset('assets/pdf/quran.pdf'),
                          );
                          Get.to(
                            () => QuranScreen(controllerPinch: controller),
                          );
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.allah,
                        name: "اسماء الله",
                        onPressed: () {
                          Get.toNamed(Routes.allah_names);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.athkar,
                        name: "الاذكار",
                        onPressed: () {
                          Get.toNamed(Routes.athkar);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.hadeas,
                        name: "الاحاديث",
                        onPressed: () {
                          Get.toNamed(Routes.hadeas);
                        },
                      ),
                      IconWidget(
                        urlAsset: ImageUrl.pray_time,
                        name: "اوقات الصلاة",
                        onPressed: () {
                          Get.toNamed(Routes.pray_time);
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
