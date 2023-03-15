import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/allahNames_controller.dart';
import 'package:islamic_app/core/constant/image_url.dart';

class AllahName extends StatelessWidget {
  const AllahName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllahNamesController>(builder: (controller) {
      return ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageUrl.icon,
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    indent: 6,
                                    endIndent: 0,
                                  ),
                                  Text(
                                    "${controller.data[index]['name']}",
                                    style:  TextStyle(
                                        fontFamily: "Cairo", fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${controller.data[index]['text']}",
                                textAlign: TextAlign.justify,
                                style:  TextStyle(
                                    fontFamily: "Tajawal", fontSize: 16.sp),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  height: 15.h,
                ),
              ],
            );
          });
    });
  }
}
