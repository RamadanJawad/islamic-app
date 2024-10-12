import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';
import 'package:islamic_app/features/audio/view/widget/header_widget.dart';
import 'package:islamic_app/features/audio/view/widget/play_tool.dart';
import 'package:islamic_app/features/audio/view/widget/reciters_widget.dart';
import 'package:islamic_app/features/audio/view/widget/surah_widget.dart';
import 'package:islamic_app/features/audio/view/widget/text_widget.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AudioController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: ManagerColors.backgroundColor,
          elevation: 0,
          title: Text(
            "القرآن استماع",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ManagerHeight.h10,
              ),
              const Center(child: HeaderAudio()),
              const PlayTool(),
              SizedBox(
                height: ManagerHeight.h14,
              ),
              const TextWidget(
                text1: "قارئ مقترح",
                visible: false,
              ),
              SizedBox(
                height: ManagerHeight.h14,
              ),
              const RecitersWidget(),
              SizedBox(
                height: ManagerHeight.h14,
              ),
              SizedBox(
                height: ManagerHeight.h10,
              ),
              for (int i = 0; i < Data().surahs.length; i++) ...{
                SurahWidget(
                  index: i,
                  text: Data().surahs[i],
                  onTap: () {
                    controller.changeName(i);
                  },
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
