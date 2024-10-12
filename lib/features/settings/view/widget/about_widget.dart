import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w6, vertical: ManagerHeight.h6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ManagerStrings.about,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Get.defaultDialog(
                title: ManagerStrings.about,
                titleStyle: const TextStyle(fontFamily: "Noor"),
                middleTextStyle: const TextStyle(fontFamily: "Noor"),
                cancel: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.mainColor),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(ManagerStrings.close,
                        style: TextStyle(fontFamily: "Noor"))),
                middleText: ManagerStrings.aboutApp,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ManagerAssets.information,
                  width: ManagerWidth.w24,
                  height: ManagerHeight.h24,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  "حول التطبيق",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Share.share(
                  "تطبيق أذكار المسلم \n https://play.google.com/store/apps/details?id=com.azker96.azker1196");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ManagerAssets.share,
                  width: ManagerWidth.w22,
                  height: ManagerHeight.h22,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.shareApp,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Uri gmailUrl = Uri.parse(
                  'mailto:shafiealmuslim@gmail.com?subject=الدعم الفني:&body=');
              _launchUrl(gmailUrl);
            },
            child: Row(
              children: [
                Image.asset(
                  ManagerAssets.technicalSupport,
                  width: ManagerWidth.w22,
                  height: ManagerHeight.h22,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.support,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              var whatsapp = "+970598979132";
              var whatsappAndroid = Uri.parse(
                  "whatsapp://send?phone=$whatsapp&text=مرحبا كيف يمكنني مساعدتك؟ ");
              _launchUrl(whatsappAndroid);
            },
            child: Row(
              children: [
                Image.asset(
                  ManagerAssets.socialMedia,
                  width: ManagerWidth.w22,
                  height: ManagerHeight.h22,
                ),
                SizedBox(
                  width: ManagerWidth.w6,
                ),
                Text(
                  "للاستفسار والتواصل",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: ManagerHeight.h6,
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
