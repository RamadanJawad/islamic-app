import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/permission.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/home/view/widget/ayha_widget.dart';
import 'package:islamic_app/features/home/view/widget/hadees.dart';
import 'package:islamic_app/features/home/view/widget/header_widget.dart';
import 'package:islamic_app/features/pray_time/view/widget/praytime_widget.dart';
import 'package:islamic_app/features/home/view/widget/quran_audio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      HeaderWidget(),
                      PrayTimeWidget(),
                      QuranAudio(),
                      AyhaWidget(),
                      HadeesWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
