import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:share_plus/share_plus.dart';

class ListHadith extends StatelessWidget {
  final String name;
  final String hadith;
  final String id;
  const ListHadith(
      {super.key, required this.name, required this.hadith, required this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          title: Text(
            "$name",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 20.sp,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
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
                            "$id",
                            style:
                                TextStyle(fontSize: 18.sp, fontFamily: "Cairo"),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        height: 40.h,
                        child: Text("$name",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Cairo",
                                fontSize: 16.sp,
                                color: Colors.white)),
                        decoration: BoxDecoration(
                            color: ColorCode.mainColor,
                            borderRadius: BorderRadius.circular(15).r),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: "$hadith"));
                            Get.snackbar(
                              "",
                              "تم نسخ النص بنجاح",
                              snackStyle: SnackStyle.FLOATING,
                              titleText: Text(
                                "*ملاحظة",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    fontSize: 18.sp,
                                    color: ColorCode.mainColor),
                              ),
                              margin: EdgeInsets.all(10),
                              messageText: Text(
                                "تم نسخ النص بنجاح",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontFamily: "Cairo", fontSize: 17.sp),
                              ),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          icon: const Icon(Icons.copy)),
                      IconButton(
                          onPressed: () async {
                            await Share.share("$name\n" + hadith);
                          },
                          icon: const Icon(Icons.share))
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "$hadith",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: "Tajawal", fontSize: 20.sp),
                  ),
                  const Divider(
                    color: Colors.black38,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
