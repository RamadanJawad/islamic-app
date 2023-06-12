import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class PlayTool extends StatelessWidget {
  const PlayTool({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.0),
            ),
            child: Slider(
              min: 0,
              max: controller.duration.inSeconds.toDouble(),
              activeColor: ColorCode.mainColor,
              inactiveColor: Colors.grey,
              value: controller.position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await controller.player.seek(position);
                controller.update();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.position.toString().split(".")[0],
                  style: const TextStyle(
                      fontFamily: "ibm", fontSize: 13, color: Colors.grey),
                ),
                Text(
                  controller.duration.toString().split(".")[0],
                  style: const TextStyle(
                      fontFamily: "ibm", fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10).r),
                  child: IconButton(
                    onPressed: () async {
                      await controller.getPath(
                          name:
                              "${controller.name}-${controller.surah_name}.mp3");
                    },
                    icon: controller.isLoadingAudio
                        ? CircularProgressIndicator(
                            value: controller.progress,
                            color: ColorCode.mainColor,
                          )
                        : const Icon(
                            CupertinoIcons.down_arrow,
                            color: Colors.black54,
                            size: 20,
                          ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10).r),
                  child: IconButton(
                    onPressed: () {
                      controller.skip();
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_right_to_line,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color:
                        controller.isPlaying ? Colors.red : ColorCode.mainColor,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  child: IconButton(
                    onPressed: () async {
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
                  width: 15.w,
                ),
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10).r),
                  child: IconButton(
                    onPressed: () {
                      controller.previous();
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_left_to_line,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
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
          ),
        ],
      );
    });
  }
}
