import 'dart:ui';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/quran_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/data/data.dart';

String selectedItem = '';
final jobRoleDropdownCtrl = TextEditingController();
jumpDialog() {
  Get.defaultDialog(
      title: "انتقال سريع",
      titleStyle: TextStyle(fontFamily: "Cairo", fontSize: 18),
      content: Column(
        children: [
          Container(
              width: double.infinity,
              height: 50,
              child: CustomDropdown(
                  items: Data.surahs,
                  onChanged: (var select) {
                    selectedItem = select;
                  },
                  borderSide: BorderSide(color: ColorCode.mainColor, width: 1),
                  hintText: "اختر السورة ...",
                  borderRadius: BorderRadius.circular(5),
                  selectedStyle: const TextStyle(fontFamily: "Cairo"),
                  listItemStyle: const TextStyle(
                      fontFamily: "Cairo", color: ColorCode.mainColor),
                  controller: jobRoleDropdownCtrl)),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              height: 50,
              child: CustomDropdown(
                  items: Data.surahs,
                  onChanged: (var select) {
                    selectedItem = select;
                  },
                  borderSide: BorderSide(color: ColorCode.mainColor, width: 1),
                  hintText: "اختر رقم الصفحة ...",
                  borderRadius: BorderRadius.circular(5),
                  selectedStyle: const TextStyle(fontFamily: "Cairo"),
                  listItemStyle: const TextStyle(
                      fontFamily: "Cairo", color: ColorCode.mainColor),
                  controller: jobRoleDropdownCtrl)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "اذهب الى السورة",
                  style: TextStyle(fontFamily: "Cairo"),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: ColorCode.mainColor),
              ))
        ],
      ));
}
