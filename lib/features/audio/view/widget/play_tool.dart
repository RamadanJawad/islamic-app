import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:islamic_app/features/audio/view/widget/common.dart';
import 'package:just_audio/just_audio.dart';

class PlayTool extends StatelessWidget {
  const PlayTool({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Column(
        children: [
          StreamBuilder<PositionData>(
            stream: controller.positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Column(
                children: [
                  SeekBar(
                    visible: true,
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                        positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: (newPosition) {
                      controller.player.seek(newPosition);
                    },
                  ),
                ],
              );
            },
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
                StreamBuilder<PlayerState>(
                  stream: controller.player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        width: 35.w,
                        height: 35.h,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: const CircularProgressIndicator(
                          color: ColorCode.mainColor,
                        ),
                      );
                    } else if (playing != true) {
                      return Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: playing ?? true
                              ? Colors.red
                              : ColorCode.mainColor,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.play();
                          },
                          icon: const Icon(
                            CupertinoIcons.play_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: playing! ? Colors.red : ColorCode.mainColor,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.pause();
                          },
                          icon: const Icon(
                            CupertinoIcons.pause_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: ColorCode.mainColor,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.seek(Duration.zero,
                            index: controller.player.effectiveIndices!.first);
                          },
                          icon: const Icon(
                            CupertinoIcons.reply,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ); 
                    }
                  },
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
