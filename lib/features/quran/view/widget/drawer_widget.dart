import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
import 'package:islamic_app/features/quran/view/screen/tab/tab1.dart';
import 'package:islamic_app/features/quran/view/screen/tab/tab2.dart';
import 'package:islamic_app/features/quran/view/screen/tab/tab3.dart';
import 'package:pdfx/pdfx.dart';

class DrawerWidget extends StatelessWidget {
  final PdfControllerPinch controllerPinch;
  const DrawerWidget({super.key, required this.controllerPinch});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: ManagerColors.backgroundColor,
            elevation: 0,
            title: Text(
              "القراءن الكريم",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s20, color: ManagerColors.black),
            ),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorPadding: const EdgeInsets.all(5),
              controller: controller.tabController,
              indicatorColor: ColorCode.mainColor,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    "الفهرس",
                    style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "الأجزاء",
                    style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "التفسير",
                    style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Tab1Screen(controllerPinch: controllerPinch),
              Tab2Screen(controllerPinch: controllerPinch),
              const QuranScreen(),
            ],
          ),
        );
      },
    );
  }
}
