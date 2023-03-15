import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';

class HadeesWidget extends StatelessWidget {
  const HadeesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Image.asset(
                  ImageUrl.decoration,
                  width: double.infinity,
                  height: 150.h,
                  color: ColorCode.mainColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Image.asset(
                      ImageUrl.icon,
                      width: 23.w,
                      height: 23.w,
                    ),
                    Text("دعاء اليوم",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Cairo",
                            color: ColorCode.secondaryColor)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  GetBuilder<HomeController>(builder: (controller) {
                    return Text(
                      "${controller.dua}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 18.sp,
                          color: ColorCode.secondaryColor),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
