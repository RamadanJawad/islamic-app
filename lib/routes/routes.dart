import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:islamic_app/features/pray_time/view/screen/pray_time_screen.dart';
import 'package:islamic_app/features/quran/controller/quran_controller.dart';
import 'package:islamic_app/features/settings/controller/setting_controller.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';
import 'package:islamic_app/core/config/dependency_injection.dart';
import 'package:islamic_app/features/home/view/screen/home_screen.dart';
import 'package:islamic_app/features/quran/view/screen/quran_screen.dart';
import 'package:islamic_app/features/settings/view/screen/setting_screen.dart';
import 'package:islamic_app/features/subha/view/screen/subha_screen.dart';
import 'package:islamic_app/features/allah_names/view/screen/allah_names.dart';
import 'package:islamic_app/features/athkar/view/screen/athkar_screen.dart';
import 'package:islamic_app/features/hadeas/view/screen/hadith_screen.dart';
import 'package:islamic_app/features/qibla/view/screen/qibla_screen.dart';
import 'package:islamic_app/features/splash/view/screen/splash_screen.dart';
import 'package:islamic_app/features/main/view/main_screen.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String main = '/main_view';
  static const String home = '/home_view';
  static const String quran = '/quran_view';
  static const String subha = '/subha_view';
  static const String setting = '/setting_view';
  static const String allah_names = '/allah_names_view';
  static const String athkar = '/athkar_view';
  static const String hadeas = '/hadeas_view';
  static const String qibla = '/qibla_view';
  static const String pray_time = '/pray_time_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.main:
        initHome();
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.subha:
        return MaterialPageRoute(builder: (_) => const SubhaScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.allah_names:
        return MaterialPageRoute(builder: (_) => const AllahNames());
      case Routes.athkar:
        return MaterialPageRoute(builder: (_) => AthkarScreen());
      case Routes.hadeas:
        return MaterialPageRoute(builder: (_) => HadithScreen());
      case Routes.qibla:
        return MaterialPageRoute(builder: (_) => QiblaScreen());
      case Routes.pray_time:
        return MaterialPageRoute(builder: (_) => PrayTimeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("no Route Found"),
        ),
        body: const Center(
          child: Text("no Route Found"),
        ),
      ),
    );
  }
}
