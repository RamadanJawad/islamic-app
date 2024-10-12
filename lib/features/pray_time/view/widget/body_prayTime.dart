import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/features/home/view/widget/custom_text.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';
import 'package:islamic_app/features/pray_time/view/widget/custom_prayTime.dart';
import 'package:islamic_app/features/pray_time/view/widget/praytime_widget.dart';

class BodyPrayTime extends StatelessWidget {
  const BodyPrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimeController>(
      builder: (controller) {
        return Column(
          children: [
            const PrayTimeWidget(),
            const CustomText(
              text: "أوقات الصلاة",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped,
              onTap: () {
                controller.isTapController();
              },
              imagePath: ManagerAssets.fajr,
              prayTime: DateFormat.jm().format(controller.prayerTimes.fajr),
              prayTimeName: "صلاة الفجر",
              text1:
                  "من صلى الصبح فهو في ذمة الله، فلا يطلبنكم الله من ذمته بشيء فيدركه فيكبه في نار جهنم",
              text2:
                  "من صلى الصبح فهو في ذمة الله، فلا يطلبنكم الله من ذمته بشيء ...",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped1,
              onTap: () {
                controller.isTapController1();
              },
              imagePath: ManagerAssets.sunrise,
              prayTime: DateFormat.jm().format(controller.prayerTimes.sunrise),
              prayTimeName: "صلاة الشروق",
              text1:
                  "من صلى الفجر في جماعة، ثم جلس يذكر الله حتى تطلع الشمس، ثم صلى ركعتين؛ كانت له كأجر حجة وعمرة - هكذا قال- تامة",
              text2:
                  "من صلى الفجر في جماعة، ثم جلس يذكر الله حتى تطلع الشمس، ث",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped2,
              onTap: () {
                controller.isTapController2();
              },
              imagePath: ManagerAssets.dhuhr,
              prayTime: DateFormat.jm().format(controller.prayerTimes.dhuhr),
              prayTimeName: "صلاة الظهر",
              text1:
                  "أوَّل صلاةٍ صلاها الرَّسول -صلى الله عليه وسلم- بعد عودته من رحلة الإسراء والمعراج هي صلاة الظهر",
              text2:
                  "أوَّل صلاةٍ صلاها الرَّسول -صلى الله عليه وسلم- بعد عودته من رح..",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped3,
              onTap: () {
                controller.isTapController3();
              },
              imagePath: ManagerAssets.asr,
              prayTime: DateFormat.jm().format(controller.prayerTimes.asr),
              prayTimeName: "صلاة العصر",
              text1:
                  "من ترك صلاة العصر فقد حبط عمله وقال ﷺ من فاتته صلاة العصر فكأنما وتر أهله وماله.",
              text2:
                  "من ترك صلاة العصر فقد حبط عمله وقال ﷺ من فاتته صلاة الع...",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped4,
              onTap: () {
                controller.isTapController4();
              },
              imagePath: ManagerAssets.maghrib,
              prayTime: DateFormat.jm().format(controller.prayerTimes.maghrib),
              prayTimeName: "صلاة المغرب",
              text1:
                  "لا تزال أمتي بخير أو على الفطرة ما لم يؤخروا المغرب حتى تشتبك \nالنجوم",
              text2:
                  "لا تزال أمتي بخير أو على الفطرة ما لم يؤخروا المغرب حتى تشتبك ... ",
            ),
            CustomPrayTime(
              isTapped: controller.isTapped5,
              onTap: () {
                controller.isTapController5();
              },
              imagePath: ManagerAssets.isha,
              prayTime: DateFormat.jm().format(controller.prayerTimes.isha),
              prayTimeName: "صلاة العشاء",
              text1:
                  "من صلى العشاء في جماعة فكأنما قام نصف الليل ومن صلى الصبح في جماعة فكأنما صلى الليل كله",
              text2:
                  "من صلى العشاء في جماعة فكأنما قام نصف الليل ومن صلى الص..",
            ),
            Spacer(),
            Container(
                alignment: Alignment.center,
                width: controller.homeController.bannerAd.size.width.toDouble(),
                height:
                    controller.homeController.bannerAd.size.height.toDouble(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r16)),
                child: controller.homeController.isBannerAd
                    ? AdWidget(ad: controller.homeController.bannerAd)
                    : SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
