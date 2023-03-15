import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/view/widget/quran/display_quran.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (SharedPrefController().nameQuran != null) ...{
              Container(
                width: double.infinity,
                height: 100.h,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Image.asset(
                        ImageUrl.quran_logo,
                        color: ColorCode.mainColor,
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "آخر سورة تم قراءتها هي ",
                            style:
                                TextStyle(fontFamily: "Tajawal", fontSize: 20.sp),
                          ),
                          Text(
                            "${controller.name}",
                            style:  TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 20.sp,
                                color: ColorCode.mainColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                    color: Colors.grey[300]),
              ),
            },
             SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: Data.surahs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.onClick(index);
                        Get.to(() => DisplayQuran(
                              number: index + 1,
                              name: Data.surahs[index],
                            ));
                      },
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/vector.png",
                                width: 45.w,
                                height: 45.h,
                                color: ColorCode.mainColor,
                              ),
                              Text(
                                "${index + 1}",
                                style:  TextStyle(
                                    fontSize: 16.sp, fontFamily: "Cairo"),
                              ),
                            ],
                          ),
                           SizedBox(
                            width: 10.w,
                          ),
                          Text(Data.surahs[index],
                              style:  TextStyle(
                                  fontFamily: "Cairo", fontSize: 18.sp)),
                          Spacer(),
                          Column(
                            children: [
                              Text("${Data.revelationType[index]}",
                                  style:  TextStyle(
                                      fontFamily: "Tajawal",
                                      fontSize: 16.sp,
                                      color: Colors.grey)),
                              Text("آية:${Data.ayahOfSurah[index]}",
                                  style:  TextStyle(
                                      fontFamily: "Tajawal",
                                      fontSize: 16.sp,
                                      color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
