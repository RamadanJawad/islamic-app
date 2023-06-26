import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/quran/view/widget/drawer_widget.dart';
import 'package:pdfx/pdfx.dart';

class QuranScreen extends StatelessWidget {
  final PdfControllerPinch controllerPinch;
  const QuranScreen({super.key, required this.controllerPinch});
  @override
  Widget build(BuildContext context) {
    Get.put<TabsController>(TabsController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<TabsController>(
        builder: (controller) {
          return Scaffold(
            drawer: Drawer(
              child: DrawerWidget(controllerPinch: controllerPinch),
            ),
            appBar: AppBar(
              title: Text("القرآن الكريم",
                  style: TextStyle(fontFamily: "ibm", fontSize: 20.sp)),
              backgroundColor: ColorCode.mainColor,
              elevation: 0,
            ),
            body: SafeArea(
              child: PdfViewPinch(
                controller: controllerPinch,
                padding: 5,
              ),
            ),
          );
        },
      ),
    );
  }
}
