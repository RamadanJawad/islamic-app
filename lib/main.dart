import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_app/core/class/notification_manager.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/routes/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPreferences();
  await LocalNotificationService().initialize();
  HijriCalendar.setLocal("ar");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 803),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(primaryColor: ColorCode.mainColor),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashView,
        );
      },
    );
  }
}
