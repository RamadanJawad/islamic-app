import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
import 'package:share_plus/share_plus.dart';

class ListDataAthkar extends StatelessWidget {
  final String name;
  final List data;
  const ListDataAthkar({
    super.key,
    required this.name,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            name,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              child: CustomWidget(
                title: "عدد المرات :${data[index]['counter']}",
                subTitle: data[index]['text'],
                onPressedShare: () async {
                  await Share.share(
                      "$name\n${data[index]['text']}${data[index]['counter']} مرات ");
                },
                onPressedCopy: () {
                  copyFunction(
                      text:
                          "$name \n${data[index]['text']}${data[index]['counter']} مرات ");
                },
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Stack(
            //             alignment: Alignment.center,
            //             children: [
            //               Image.asset(
            //                 "assets/images/vector.png",
            //                 width: 40.w,
            //                 height: 40.h,
            //                 color: ColorCode.mainColor,
            //               ),
            //               Text(
            //                 "${data[index]['id']}",
            //                 style:
            //                     TextStyle(fontSize: 18.sp, fontFamily: "ibm"),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //             width: 20.w,
            //           ),
            //           Container(
            //             alignment: Alignment.center,
            //             width: 200.w,
            //             height: 40.h,
            //             decoration: BoxDecoration(
            //                 color: ColorCode.mainColor,
            //                 borderRadius: BorderRadius.circular(15).r),
            //             child: Text("عدد المرات :${data[index]['counter']}",
            //                 style: TextStyle(
            //                     fontFamily: "ibm",
            //                     fontSize: 16.sp,
            //                     color: Colors.white)),
            //           ),
            //           const Spacer(),
            //           IconButton(
            //               onPressed: () {
            //                 Clipboard.setData(ClipboardData(
            //                     text:
            //                         "$name \n${data[index]['text']}${data[index]['counter']} مرات "));
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
            //                 await Share.share(
            //                     "$name\n${data[index]['text']}${data[index]['counter']} مرات ");
            //               },
            //               icon: const Icon(Icons.share))
            //         ],
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         "${data[index]['text']}",
            //         textAlign: TextAlign.justify,
            //         style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
            //       ),
            //       const Divider(
            //         color: Colors.black38,
            //       )
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
