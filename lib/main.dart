import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/view/screen/utils/launch_screen.dart';
import 'package:islamic_app/view/screen/utils/main_screen.dart';
import 'package:islamic_app/view/screen/utils/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPreferences();
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
          home:  LaunchScreen(),
          getPages: [
            GetPage(name: "/main_screen", page: () => const MainScreen()),
            GetPage(
                name: "/boarding_screen", page: () => const OnBoardingScreen()),
          ],
        );
      },
    );
  }
}