import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
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
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "القراءن الكريم",
              style: TextStyle(fontFamily: "ibm", color: ColorCode.mainColor),
            ),
            backgroundColor: Colors.white,
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
                    style: TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    "الأجزاء",
                    style: TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    "التفسير",
                    style: TextStyle(fontFamily: "ibm", fontSize: 16.sp),
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
              QuranScreen(),
            ],
          ),
        );
      },
    );
  }
}
