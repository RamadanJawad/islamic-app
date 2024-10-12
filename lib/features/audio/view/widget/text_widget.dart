import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class TextWidget extends StatelessWidget {
  final String text1;
  final void Function()? onTap;
  final bool visible;
  const TextWidget({
    Key? key,
    required this.text1,
    this.onTap,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ),
            Visibility(
              visible: visible,
              child: InkWell(
                onTap: onTap,
                child: const Icon(CupertinoIcons.search),
              ),
            ),
          ],
        ),
      );
    });
  }
}
