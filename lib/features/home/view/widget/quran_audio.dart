import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:islamic_app/features/audio/view/screen/audio_screen.dart';
import 'package:islamic_app/features/audio/view/widget/common.dart';
import 'package:just_audio/just_audio.dart';

class QuranAudio extends StatelessWidget {
  const QuranAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(
        init: AudioController(),
        builder: (controller) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                style: TextStyle(
                                    fontFamily: "ibm", fontSize: 16.sp),
                              ),
                              Text(
                                controller.surah_name,
                                style: TextStyle(
                                    fontFamily: "ibm", fontSize: 14.sp),
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
                          StreamBuilder<PositionData>(
                            stream: controller.positionDataStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              return Expanded(
                                flex: 1,
                                child: SeekBar(
                                  visible: false,
                                  duration:
                                      positionData?.duration ?? Duration.zero,
                                  position:
                                      positionData?.position ?? Duration.zero,
                                  bufferedPosition:
                                      positionData?.bufferedPosition ??
                                          Duration.zero,
                                  onChangeEnd: (newPosition) {
                                    controller.player.seek(newPosition);
                                  },
                                ),
                              );
                            },
                          ),
                          StreamBuilder<PlayerState>(
                            stream: controller.player.playerStateStream,
                            builder: (context, snapshot) {
                              final playerState = snapshot.data;
                              final processingState =
                                  playerState?.processingState;
                              final playing = playerState?.playing;
                              if (processingState == ProcessingState.loading ||
                                  processingState ==
                                      ProcessingState.buffering) {
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
                              } else if (processingState !=
                                  ProcessingState.completed) {
                                return Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    color: playing!
                                        ? Colors.red
                                        : ColorCode.mainColor,
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
                                          index: controller
                                              .player.effectiveIndices!.first);
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
