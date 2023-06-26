import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/data/data.dart';
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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white10,
          elevation: 0,
          title: Text(
            "القرآن استماع",
            style: TextStyle(
                fontFamily: "ibm", fontSize: 20.sp, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const Center(child: HeaderAudio()),
              const PlayTool(),
              SizedBox(
                height: 15.h,
              ),
              const TextWidget(
                text1: "قارئ مقترح",
                visible: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              const RecitersWidget(),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 10.h,
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
