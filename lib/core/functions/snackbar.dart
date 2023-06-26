import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String content, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "ibm", fontSize: 16.sp),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 1),
    ),
  );
}
