import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/functions/alert_exit.dart';
import 'package:islamic_app/features/main/controller/bottomNavi_contoller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: alertExitApp,
        child: PersistentTabView(
          context,
          controller: controller.persistentTabController,
          backgroundColor: Colors.grey.shade100,
          handleAndroidBackButtonPress: true,
          navBarStyle: NavBarStyle.style8,
          confineInSafeArea: true,
          screens: controller.screens,
          items: [
            PersistentBottomNavBarItem(
              icon: const ImageIcon(AssetImage(ImageUrl.home)),
              title: ("الرئيسية"),
              textStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.secondaryColor),
              activeColorPrimary: ColorCode.mainColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const ImageIcon(AssetImage(ImageUrl.beads)),
              title: ("المسبحة"),
              textStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.secondaryColor),
              activeColorPrimary: ColorCode.mainColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const ImageIcon(AssetImage(ImageUrl.brain)),
              title: ("ثقف عقلك"),
              textStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.secondaryColor),
              activeColorPrimary: ColorCode.mainColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: ImageIcon(AssetImage(ImageUrl.qibla)),
              title: ("القبلة"),
              textStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.secondaryColor),
              activeColorPrimary: ColorCode.mainColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const ImageIcon(AssetImage(ImageUrl.settings)),
              title: ("الاعدادات"),
              textStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.secondaryColor),
              activeColorPrimary: ColorCode.mainColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
          ],
        ),
      ),
    );
  }
}