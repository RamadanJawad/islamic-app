import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:islamic_app/features/audio/view/screen/audio_screen.dart';

class QuranAudio extends StatelessWidget {
  const QuranAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(() => const AudioScreen());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r),
            child: Container(
              height: 140.h,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(controller.image),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.name,
                            style:
                                TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                          ),
                          Text(
                            controller.surah_name,
                            style:
                                TextStyle(fontFamily: "ibm", fontSize: 14.sp),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: controller.isRepeatModeEnabled
                                ? ColorCode.mainColor
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10).r),
                        child: IconButton(
                          onPressed: () {
                            controller.releaseMode();
                          },
                          icon: Icon(
                            CupertinoIcons.arrow_2_squarepath,
                            color: controller.isRepeatModeEnabled
                                ? Colors.white
                                : Colors.black54,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        controller.position.toString().split(".")[0],
                        style: TextStyle(fontFamily: "ibm", fontSize: 13.sp),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 7.0),
                        ),
                        child: Expanded(
                          flex: 2,
                          child: Slider(
                            min: 0,
                            max: controller.duration.inSeconds.toDouble(),
                            activeColor: ColorCode.mainColor,
                            inactiveColor: Colors.grey,
                            value: controller.position.inSeconds.toDouble(),
                            onChanged: (value) async {
                              final position = Duration(seconds: value.toInt());
                              await controller.player.seek(position);
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: controller.isPlaying
                                ? Colors.red
                                : ColorCode.mainColor,
                            borderRadius: BorderRadius.circular(10).r),
                        child: IconButton(
                          onPressed: () {
                            controller.checkPlaying();
                          },
                          icon: Icon(
                            controller.isPlaying
                                ? CupertinoIcons.pause
                                : CupertinoIcons.play_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10).r),
                        child: IconButton(
                          onPressed: () {
                            Get.to(
                              () => const AudioScreen(),
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.music_note_list,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
