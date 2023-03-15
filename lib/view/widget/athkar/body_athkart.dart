import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/athkar_controller.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/data/data.dart';

class BodyAthkar extends StatelessWidget {
  const BodyAthkar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AthkarController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: Data.duaa.length,
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
                            width: 45.w,
                            height: 45.h,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            indent: 6.w,
                            endIndent: 6.w,
                          ),
                          Text(
                            "${Data.duaa[index]}",
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
