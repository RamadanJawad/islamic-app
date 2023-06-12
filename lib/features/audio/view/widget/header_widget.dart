import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class HeaderAudio extends StatelessWidget {
  const HeaderAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30).r,
            child: Image.asset(
              controller.image,
              fit: BoxFit.cover,
              width: 150.w,
              height: 150.h,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            controller.name,
            style: TextStyle(
              fontFamily: "ibm",
              fontSize: 18.sp,
            ),
          ),
          Text(
            controller.surah_name,
            style: TextStyle(
                fontFamily: "ibm", fontSize: 17.sp, color: Colors.grey),
          ),
        ],
      );
    });
  }
}