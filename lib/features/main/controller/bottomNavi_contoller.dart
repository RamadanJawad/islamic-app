import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/home/view/screen/home_screen.dart';
import 'package:islamic_app/features/qibla/view/screen/qibla_screen.dart';
import 'package:islamic_app/features/questions/view/screen/questions_screen.dart';
import 'package:islamic_app/features/settings/view/screen/setting_screen.dart';
import 'package:islamic_app/features/subha/view/screen/subha_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavigationController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex:0);
  List<Widget> screens = [
    const HomeScreen(),
    const SubhaScreen(),
    const QuestionScreen(),
    const QiblaScreen(),
    const SettingScreen(),
  ];
}
