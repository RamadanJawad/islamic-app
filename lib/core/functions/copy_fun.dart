import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

import '../resources/manager_fonts.dart';

copyFunction({required String text}) {
  Clipboard.setData(ClipboardData(text: text));
  Get.showSnackbar(GetSnackBar(
    backgroundColor: ColorCode.mainColor,
    messageText: Text("تم نسخ النص بنجاح ",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s15, color: ManagerColors.white)),
    duration: Duration(seconds: 2),
  ));
}
