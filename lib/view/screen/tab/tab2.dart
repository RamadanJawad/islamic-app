import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/data/ayah.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(builder: (controller) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 50.h,
                margin: EdgeInsets.all(10),
                child: CustomDropdown(
                    items: Data.surahs,
                    onChanged: (var select) {
                      controller.onChange(select);
                    },
                    borderSide:
                        BorderSide(color: ColorCode.mainColor, width: 1.w),
                    hintText: "اختر السورة ...",
                    borderRadius: BorderRadius.circular(5).r,
                    selectedStyle: const TextStyle(fontFamily: "Cairo"),
                    listItemStyle: const TextStyle(
                        fontFamily: "Cairo", color: ColorCode.mainColor),
                    controller: controller.jobRoleDropdownCtrl)),
            Expanded(
              child: Container(
                width: double.infinity,

                child: ListView.builder(
                    itemCount: controller.item2.length,
                    itemBuilder: (context, index) {
                      for (var i in quranText) {
                        if (i['name'] == controller.selectedItem) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              color: ColorCode.mainColor.withOpacity(0.3),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${controller.getVerse(i['surah_number'], i['verse_number'] + index)}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.sp, fontFamily: "Tajawal"),
                                ),
                                const Divider(
                                  endIndent: 6,
                                  indent: 6,
                                  color: Colors.black,
                                ),
                                Text(
                                  "${controller.item2[index]['text']}.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 17.sp, fontFamily: "Tajawal"),
                                )
                              ],
                            ),
                          );
                        }
                      }
                      return Text("no data");
                    }),
              ),
            )
          ],
        ),
      );
    });
  }
}
