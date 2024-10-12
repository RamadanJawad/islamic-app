import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/functions/alert_exit.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/home/view/screen/home_screen.dart';
import 'package:islamic_app/features/qibla/view/screen/qibla_screen.dart';
import 'package:islamic_app/features/quran/view/screen/quran_screen.dart';
import 'package:islamic_app/features/settings/view/screen/setting_screen.dart';
import 'package:pdfx/pdfx.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
          onWillPop: alertExitApp,
          child: PersistentTabView(tabs: [
            PersistentTabConfig(
              screen: const HomeScreen(),
              item: ItemConfig(
                title: ("الرئيسية"),
                activeForegroundColor: ColorCode.mainColor,
                textStyle: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.white),
                icon: const ImageIcon(
                  AssetImage(ManagerAssets.home),
                ),
              ),
            ),
            PersistentTabConfig(
              screen: QuranScreen(
                controllerPinch: controller,
              ),
              item: ItemConfig(
                title: ("القراءن الكريم"),
                textStyle: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.white),
                activeForegroundColor: ColorCode.mainColor,
                icon: const ImageIcon(
                  AssetImage(ManagerAssets.quran),
                ),
              ),
            ),
            PersistentTabConfig(
              screen: QiblaScreen(),
              item: ItemConfig(
                title: ("القبلة"),
                textStyle: getRegularTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.white),
                activeForegroundColor: ColorCode.mainColor,
                icon: const ImageIcon(
                  AssetImage(ManagerAssets.qibla),
                ),
              ),
            ),
            PersistentTabConfig(
              screen: const SettingScreen(),
              item: ItemConfig(
                title: ("الاعدادات"),
                textStyle: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.white),
                activeForegroundColor: ColorCode.mainColor,
                icon: const ImageIcon(
                  AssetImage(ManagerAssets.settings),
                ),
              ),
            ),
          ], navBarBuilder: (nav) => Style7BottomNavBar(navBarConfig: nav))),
    );
  }
}
