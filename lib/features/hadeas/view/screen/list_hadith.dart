import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
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
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text("الحديث رقم $id",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s20, color: ManagerColors.black)),
        ),
        body: ListView(
          children: [
            CustomWidget(
              title: name,
              subTitle: hadith,
              onPressedShare: () async {
                await Share.share("$name\n$hadith");
              },
              onPressedCopy: () {
                copyFunction(text: hadith);
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Stack(
            //             alignment: Alignment.center,
            //             children: [
            //               Image.asset(
            //                 "assets/images/vector.png",
            //                 width: ManagerWidth.w40,
            //                 height: ManagerHeight.h40,
            //                 color: ColorCode.mainColor,
            //               ),
            //               Text(
            //                 id,
            //                 style: getRegularTextStyle(
            //                     fontSize: ManagerFontSize.s18,
            //                     color: ManagerColors.black),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //             width: ManagerWidth.w20,
            //           ),
            //           Container(
            //             alignment: Alignment.center,
            //             width: ManagerWidth.w205,
            //             height: 40.h,
            //             decoration: BoxDecoration(
            //                 color: ColorCode.mainColor,
            //                 borderRadius: BorderRadius.circular(15).r),
            //             child: Text(name,
            //                 style: TextStyle(
            //                     overflow: TextOverflow.ellipsis,
            //                     fontFamily: "ibm",
            //                     fontSize: 16.sp,
            //                     color: Colors.white)),
            //           ),
            //           const Spacer(),
            //           IconButton(
            //               onPressed: () {
            //                 Clipboard.setData(ClipboardData(text: hadith));
            //                 Get.showSnackbar(const GetSnackBar(
            //                   backgroundColor: ColorCode.mainColor,
            //                   messageText: Text(
            //                     "تم نسخ النص بنجاح ",
            //                     textDirection: TextDirection.rtl,
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontFamily: "ibm",
            //                         fontSize: 16),
            //                   ),
            //                   duration: Duration(seconds: 2),
            //                 ));
            //               },
            //               icon: const Icon(Icons.copy)),
            //           IconButton(
            //               onPressed: () async {
            //                 await Share.share("$name\n$hadith");
            //               },
            //               icon: const Icon(Icons.share))
            //         ],
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         hadith,
            //         textAlign: TextAlign.justify,
            //         style: TextStyle(fontFamily: "ibm", fontSize: 20.sp),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
