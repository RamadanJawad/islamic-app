import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle:const TextStyle(fontFamily: "ibm", fontSize: 17),
      middleText: "هل تريد الخروج من التطبيق ؟",
      middleTextStyle:const TextStyle(fontFamily: "ibm", fontSize: 17),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorCode.mainColor,
                padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                foregroundColor: Colors.white),
            child:const Text(
              "نعم",
              style: TextStyle(fontFamily: "ibm", fontSize: 15),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                side:const BorderSide(color: ColorCode.mainColor, width: 1),
                foregroundColor: Colors.black),
            child:const Text(
              "لا",
              style: TextStyle(fontFamily: "ibm", fontSize: 15),
            ))
      ]);
  return Future.value(true);
}
