import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/allah_names/controller/allahNames_controller.dart';
import 'package:islamic_app/features/allah_names/view/widget/body_allahname.dart';

class AllahNames extends StatelessWidget {
  const AllahNames({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllahNamesController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            "أسماء الله الحسنى",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22, color: ManagerColors.black),
          ),
        ),
        body: const AllahName(),
      ),
    );
  }
}
