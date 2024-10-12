import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class HeaderAudio extends StatelessWidget {
  const HeaderAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r30),
            child: Image.asset(
              controller.image,
              fit: BoxFit.cover,
              width: ManagerWidth.w150,
              height: ManagerHeight.h150,
            ),
          ),
          SizedBox(
            height: ManagerHeight.h4,
          ),
          Text(controller.name,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black)),
          Text(
            controller.surah_name,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          ),
        ],
      );
    });
  }
}
