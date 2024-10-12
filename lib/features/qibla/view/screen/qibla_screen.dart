import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/qibla/controller/qibla_controller.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/features/qibla/view/widget/qibla_compos.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QiblaController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "اتجاه القبلة",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22, color: ManagerColors.black),
          ),
          backgroundColor: ManagerColors.backgroundColor,
        ),
        body: FutureBuilder(
          future: FlutterQiblah.androidDeviceSensorSupport(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.hasData) {
              return const QiblaCompass();
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
