import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/launch_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LaunchController controller = Get.put(LaunchController());
    return Scaffold(
      backgroundColor: Color(0xffE8E6E5),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            FadeTransition(
              opacity: controller.curve,
              child: Image.asset(
                ImageUrl.logo,
                width: 200.w,
                height: 200.h,
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "شفيع",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontFamily: "Cairo",
                    color: ColorCode.secondaryColor),
              ),
              TextSpan(
                text: " المسلم",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontFamily: "Cairo",
                    color: ColorCode.mainColor),
              )
            ])),
            Spacer(),
            Image.asset(
              ImageUrl.mosque,
              color: ColorCode.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
