import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          descTextStyle: TextStyle(fontFamily: "ibm", fontSize: 17.sp),
          titleTextStyle: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
          buttonsTextStyle: TextStyle(fontFamily: "ibm", fontSize: 17.sp),
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress)
      .show();
}
