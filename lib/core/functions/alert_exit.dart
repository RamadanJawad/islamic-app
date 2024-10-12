import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: getBoldTextStyle(
          fontSize: ManagerFontSize.s16, color: ManagerColors.black),
      middleText: "هل تريد الخروج من التطبيق ؟",
      middleTextStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: ManagerColors.black),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorCode.mainColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                foregroundColor: Colors.white),
            child: Text(
              "نعم",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                side: const BorderSide(color: ColorCode.mainColor, width: 1),
                foregroundColor: Colors.black),
            child: Text(
              "لا",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ))
      ]);
  return Future.value(true);
}
