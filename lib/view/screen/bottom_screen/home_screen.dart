import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/home_controller.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/view/widget/home/hadees.dart';
import 'package:islamic_app/view/widget/home/ayha_widget.dart';
import 'package:islamic_app/view/widget/home/header_widget.dart';
import 'package:islamic_app/view/widget/home/praytime_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(),
                    SizedBox(
                      height: 5.h,
                    ),
                    if(SharedPrefController().latitude != null)...{
                      const PrayTimeWidget(),
                    },
                    SizedBox(
                      height: 5.h,
                    ),
                    const AyhaWidget(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const HadeesWidget(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
