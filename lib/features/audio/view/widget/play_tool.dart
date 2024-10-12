import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:just_audio/just_audio.dart';

class PlayTool extends StatelessWidget {
  const PlayTool({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (controller) {
      return Column(
        children: [
          Obx(()=>
             Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
              child: Row(
                children: [
                  Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch(controller.position.value)
                            ?.group(1) ??
                        controller.position.value,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black),
                  ),
                  Expanded(
                    child: Slider(
                      thumbColor: ManagerColors.mainColor,
                      value: controller.value.value,
                      min: const Duration(seconds: 0).inSeconds.toDouble(),
                      max: controller.max.value + 1,
                      inactiveColor: ManagerColors.greyLight,
                      activeColor: ManagerColors.mainColor,
                      onChanged: (val) {
                        controller.changeDurationToSeconds(val.toInt());
                      },
                    ),
                  ),
                  Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch(controller.duration.value)
                            ?.group(1) ??
                        controller.duration.value,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ManagerWidth.w36,
                  height: ManagerHeight.h36,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                  child: IconButton(
                    onPressed: () {
                      controller.skip();
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_right_to_line,
                      color: Colors.black54,
                      size: ManagerIconSize.s20,
                    ),
                  ),
                ),
                SizedBox(
                  width: ManagerWidth.w16,
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
                        width: ManagerWidth.w36,
                        height: ManagerHeight.h36,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        child: const CircularProgressIndicator(
                          color: ColorCode.mainColor,
                        ),
                      );
                    } else if (playing != true) {
                      return Container(
                        width: ManagerWidth.w36,
                        height: ManagerHeight.h36,
                        decoration: BoxDecoration(
                          color: playing ?? true
                              ? Colors.red
                              : ColorCode.mainColor,
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.play();
                          },
                          icon: Icon(
                            CupertinoIcons.play_fill,
                            color: Colors.white,
                            size: ManagerIconSize.s20,
                          ),
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return Container(
                        width: ManagerWidth.w36,
                        height: ManagerHeight.h36,
                        decoration: BoxDecoration(
                          color: playing! ? Colors.red : ColorCode.mainColor,
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.pause();
                          },
                          icon: Icon(
                            CupertinoIcons.pause_fill,
                            color: Colors.white,
                            size: ManagerIconSize.s20,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: ManagerWidth.w36,
                        height: ManagerHeight.h36,
                        decoration: BoxDecoration(
                          color: ColorCode.mainColor,
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.player.seek(Duration.zero,
                                index:
                                    controller.player.effectiveIndices!.first);
                          },
                          icon: Icon(
                            CupertinoIcons.reply,
                            color: Colors.white,
                            size: ManagerIconSize.s20,
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: ManagerWidth.w16,
                ),
                Container(
                  width: ManagerWidth.w36,
                  height: ManagerHeight.h36,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                  child: IconButton(
                    onPressed: () {
                      controller.previous();
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_left_to_line,
                      color: Colors.black54,
                      size: ManagerIconSize.s20,
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
