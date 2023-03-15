import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: TextStyle(fontFamily: "Cairo", fontSize: 17),
      middleText: "هل تريد الخروج من التطبيق ؟",
      middleTextStyle: TextStyle(fontFamily: "Cairo", fontSize: 17),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorCode.mainColor,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                foregroundColor: Colors.white),
            child: Text(
              "نعم",
              style: TextStyle(fontFamily: "Cairo", fontSize: 15),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                side: BorderSide(color: ColorCode.mainColor, width: 1),
                foregroundColor: Colors.black),
            child: Text(
              "لا",
              style: TextStyle(fontFamily: "Cairo", fontSize: 15),
            ))
      ]);
  return Future.value(true);
}
