import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/features/allah_names/view/screen/allah_names.dart';
import 'package:islamic_app/features/athkar/view/screen/athkar_screen.dart';
import 'package:islamic_app/features/audio/view/screen/audio_screen.dart';
import 'package:islamic_app/features/chance/view/screen/chance_screen.dart';
import 'package:islamic_app/features/hadeas/view/screen/hadith_screen.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:islamic_app/features/home/view/widget/custom_appBar.dart';
import 'package:islamic_app/features/home/view/widget/custom_counter.dart';
import 'package:islamic_app/features/home/view/widget/custom_icon.dart';
import 'package:islamic_app/features/home/view/widget/custom_text.dart';
import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
import 'package:islamic_app/features/pray_time/view/screen/pray_time_screen.dart';
import 'package:islamic_app/features/pray_time/view/widget/praytime_widget.dart';
import 'package:islamic_app/features/roqia/view/screen/roqia_screen.dart';
import 'package:islamic_app/features/subha/view/screen/subha_screen.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF1EEE5),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding:
                EdgeInsets.only(left: ManagerWidth.w8, right: ManagerWidth.w8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                const PrayTimeWidget(),
                SizedBox(height: ManagerHeight.h10),
                const CustomText(
                  text: "الاختصارات",
                ),
                SizedBox(height: ManagerHeight.h6),
                SizedBox(
                  height: ManagerHeight.h200,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    padding: const EdgeInsets.all(5),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      CustomIcon(
                          title: "صوتيات",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => const AudioScreen());
                            }
                            Get.to(() => const AudioScreen());
                          },
                          imageUrl: "assets/images/quranlogo.png"),
                      CustomIcon(
                          title: "مكتبة الحديث",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => const HadithScreen());
                            }
                            Get.to(() => const HadithScreen());
                          },
                          imageUrl: "assets/images/muhammed.png"),
                      CustomIcon(
                          title: "حصن المسلم",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => AthkarScreen());
                            }
                            Get.to(() => AthkarScreen());
                          },
                          imageUrl: "assets/images/azkar.png"),
                      CustomIcon(
                          title: "المسبحة",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => const SubhaScreen());
                            }
                            Get.to(() => const SubhaScreen());
                          },
                          imageUrl: "assets/images/sibha.png"),
                      CustomIcon(
                          title: "اسماء الله ",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => const AllahNames());
                            }
                            Get.to(() => const AllahNames());
                          },
                          imageUrl: "assets/images/names.png"),
                      CustomIcon(
                          title: "مواقيت الصلاة",
                          onTap: () {
                            if (controller.isInterstitialAd) {
                              controller.showInterstitialAd();
                              Get.to(() => const PrayTimeScreen());
                            }
                            Get.to(() => const PrayTimeScreen());
                          },
                          imageUrl: "assets/images/clock.png"),
                      CustomIcon(
                          title: "الرقية الشرعية",
                          onTap: () {
                            Get.to(() => const RoqiaScreen());
                          },
                          imageUrl: "assets/images/dua.png"),
                      CustomIcon(
                          title: "فرص ذهبية",
                          onTap: () {
                            Get.to(() => const ChanceScreen());
                          },
                          imageUrl: "assets/images/chance.png"),
                    ],
                  ),
                ),
                Obx(
                  () => CustomCounter(
                    counter: controller.counter.toString(),
                    onPressedAdd: () {
                      controller.changeCounter();
                    },
                    onPressedReply: () {
                      controller.counter.value = 0;
                    },
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                CustomWidget(
                  title: "دعاء اليوم",
                  subTitle: controller.dua.toString(),
                  onPressedCopy: () {
                    copyFunction(
                        text:
                            "دعاء اليوم \n ${controller.dua.toString()} \n تطبيق أذكار المسلم");
                  },
                  onPressedShare: () async {
                    await Share.share(
                        "دعاء اليوم \n ${controller.dua.toString()} \n تطبيق أذكار المسلم");
                  },
                ),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                CustomWidget(
                    title: "آية وعبرة",
                    onPressedCopy: () {
                      copyFunction(
                          text:
                              "آية وعبرة \n ۞ ${controller.data["text1"].toString()} ۞ \n ${controller.data["text2"].toString()} \n تطبيق أذكار المسلم");
                    },
                    onPressedShare: () async {
                      await Share.share(
                          "آية وعبرة \n ۞ ${controller.data["text1"].toString()} ۞ \n ${controller.data["text2"].toString()} \n تطبيق أذكار المسلم");
                    },
                    subTitle:
                        "۞ ${controller.data["text1"].toString()} ۞ \n ${controller.data["text2"].toString()}"),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
