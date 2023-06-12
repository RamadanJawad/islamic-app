import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/splash/controller/splash_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';

class BodySplash extends StatelessWidget {
  const BodySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Column(
          children: [
            const Spacer(),
            FadeTransition(
              opacity: controller.curve,
              child: Column(
                children: [
                  Image.asset(
                    ImageUrl.logo,
                    width: 200.w,
                    height: 200.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "شفيع",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: "ibm",
                              color: ColorCode.secondaryColor),
                        ),
                        TextSpan(
                          text: " المسلم",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: "ibm",
                              color: ColorCode.mainColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              ImageUrl.mosque,
              color: ColorCode.mainColor,
            ),
          ],
        );
      },
    );
  }
}
