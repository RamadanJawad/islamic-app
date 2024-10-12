import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/athkar/controller/athkar_controller.dart';
import 'package:islamic_app/features/athkar/view/widget/body_athkart.dart';

class AthkarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AthkarController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ManagerColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: ManagerColors.backgroundColor,
            title: Text(
              "الاذكار",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s22, color: ManagerColors.black),
            ),
          ),
          body: const BodyAthkar()),
    );
  }
}
