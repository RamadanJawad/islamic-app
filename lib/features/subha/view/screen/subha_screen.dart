import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';
import 'package:islamic_app/features/subha/view/widget/body_widget.dart';
import 'package:islamic_app/features/subha/view/widget/custom_point.dart';
import 'package:islamic_app/features/subha/view/widget/number_head.dart';

class SubhaScreen extends StatelessWidget {
  const SubhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<TasabihController>(TasabihController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            ManagerStrings.subhaScreenName,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.mainColor),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const NumberHead(),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                const BodyWidget(),
                SizedBox(
                  height: ManagerHeight.h30,
                ),
                const CustomPoint(),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    width: controller.homeController.bannerAd.size.width
                        .toDouble(),
                    height: controller.homeController.bannerAd.size.height
                        .toDouble(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ManagerRadius.r16)),
                    child: controller.homeController.isBannerAd
                        ? AdWidget(ad: controller.homeController.bannerAd)
                        : SizedBox.shrink()),
              ],
            )),
      ),
    );
  }
}
