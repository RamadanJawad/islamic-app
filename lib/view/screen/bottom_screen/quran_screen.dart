import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  @override
  Widget build(BuildContext context) {
    QuranController controller = Get.put(QuranController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorCode.mainColor,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              controller: controller.tabController,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    "السور",
                    style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    "التفسير",
                    style: TextStyle(fontFamily: "Cairo", fontSize: 18.sp),
                  ),
                ),
              ],
            ),
            title: Text(
              "القران الكريم",
              style: TextStyle(fontFamily: "Cairo", fontSize: 20.sp),
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: controller.screens,
          )),
    );
  }
}
