import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controller/qibla_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/view/widget/icon/qibla_compos.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QiblaController controller = Get.put(QiblaController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "اتجاه القبلة",
            style: TextStyle(fontFamily: "Cairo", fontSize: 22.sp),
          ),
          backgroundColor: ColorCode.mainColor,
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
