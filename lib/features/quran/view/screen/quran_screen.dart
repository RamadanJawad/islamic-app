import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
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
            backgroundColor: ManagerColors.backgroundColor,
            drawer: Drawer(
              child: DrawerWidget(controllerPinch: controllerPinch),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text("القرآن الكريم",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s20,
                      color: ManagerColors.black)),
              backgroundColor: ManagerColors.backgroundColor,
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
