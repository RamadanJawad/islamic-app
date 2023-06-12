import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/functions/location.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/location.png",
                  width: double.infinity,
                  height: 200.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "للحصول على خدمة أوقات الصلاة وميزة الوقت المتبقي للصلاة القادمة يرجى الموافقة على تفعيل خدمة الموقع",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // determinePosition();
                      getLatAndLong();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.mainColor,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "اذهب الان",
                      style: TextStyle(fontFamily: "ibm", fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}