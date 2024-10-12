import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

showAwesomeDialog(
    {BuildContext? context,
    String? description,
    DialogType? dialogType,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress}) {
  AwesomeDialog(
          context: context!,
          dialogType: dialogType!,
          animType: AnimType.rightSlide,
          title: 'ملاحظة',
          desc: description,
          descTextStyle: getRegularTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          titleTextStyle: getBoldTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          buttonsTextStyle: getRegularTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress)
      .show();
}
