import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/hadith_controller.dart';
import 'package:islamic_app/core/constant/image_url.dart';

class BodyHadith extends StatelessWidget {
  const BodyHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: controller.item.length,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.onClickItem(index);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            ImageUrl.icon,
                            width: 40.w,
                            height: 40.h,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            indent: 6.r,
                            endIndent: 6.r,
                          ),
                          Text(
                            "${controller.item[index]['name']}",
                            style:
                                TextStyle(fontFamily: "Cairo", fontSize: 20.sp),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                controller.onClickItem(index);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
