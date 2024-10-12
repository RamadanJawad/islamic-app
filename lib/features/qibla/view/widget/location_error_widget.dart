import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/images/location.png",
            width: double.infinity,
            height: ManagerHeight.h200,
          ),
          SizedBox(
            height: ManagerHeight.h30,
          ),
          Text(error!,
              textAlign: TextAlign.center,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s18, color: ManagerColors.black)),
          SizedBox(
            height: ManagerHeight.h30,
          ),
          ElevatedButton(
            child: Text(
              "حاول مجددا",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.mainColor),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: ManagerColors.white),
            onPressed: () {
              if (callback != null) callback!();
            },
          ),
          Spacer(),
          Container(
              alignment: Alignment.center,
              width: controller.bannerAd.size.width.toDouble(),
              height: controller.bannerAd.size.height.toDouble(),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ManagerRadius.r16)),
              child: controller.isBannerAd
                  ? AdWidget(ad: controller.bannerAd)
                  : SizedBox.shrink()),
        ],
      ),
    );
  }
}
