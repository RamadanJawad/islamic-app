import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/splash/controller/splash_controller.dart';

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
                    ManagerAssets.logo,
                    width: ManagerWidth.w205,
                    height: ManagerHeight.h200,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ManagerStrings.subAppName1,
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s24,
                              color: ManagerColors.secondaryColor),
                        ),
                        TextSpan(
                          text: ManagerStrings.subAppName2,
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s24,
                              color: ManagerColors.mainColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              ManagerAssets.mosque,
              color: ManagerColors.mainColor,
            ),
          ],
        );
      },
    );
  }
}
