import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/functions/alert_dialog.dart';
import 'package:islamic_app/core/functions/alert_exit.dart';
import 'package:islamic_app/view/screen/bottom_screen/home_screen.dart';
import 'package:islamic_app/view/screen/bottom_screen/subha_screen.dart';
import 'package:islamic_app/view/screen/bottom_screen/quran_screen.dart';
import 'package:islamic_app/view/screen/bottom_screen/setting_screen.dart';
import 'package:islamic_app/controller/bottomNavi_contoller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Obx(
          () => IndexedStack(
            index: controller.index.value,
            children: const [
              SettingScreen(),
              SubhaScreen(),
              QuranScreen(),
              HomeScreen()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomNavigationBar(
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                title: const Text(
                  "الاعدادات",
                  style: TextStyle(
                      fontFamily: "Tajawal", color: ColorCode.secondaryColor),
                ),
              ),
              CustomNavigationBarItem(
                icon: const ImageIcon(AssetImage(ImageUrl.beads)),
                title: const Text(
                  "المسبحة",
                  style: TextStyle(
                      fontFamily: "Tajawal", color: ColorCode.secondaryColor),
                ),
              ),
              CustomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageUrl.quran)),
                title: const Text(
                  "القران الكريم",
                  style: TextStyle(
                      fontFamily: "Tajawal", color: ColorCode.secondaryColor),
                ),
              ),
              CustomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageUrl.home)),
                title: const Text(
                  "الرئيسية",
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    color: ColorCode.secondaryColor,
                  ),
                ),
              ),
            ],
            iconSize: 25.r,
            selectedColor: ColorCode.mainColor,
            unSelectedColor: Colors.grey,
            currentIndex: controller.index.value,
            strokeColor: ColorCode.mainColor,
            onTap: (val) {
              controller.onTap(val);
              if (controller.index.value == 2) {
                alertDialog();
              }
            }),
      ),
    );
  }
}
