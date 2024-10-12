import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/awesome_dialog.dart';
import 'package:islamic_app/core/functions/check_internet.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:just_audio_background/just_audio_background.dart';

class AudioController extends GetxController {
  bool isPlaying = false;
  AudioPlayer player = AudioPlayer();
  var duration = ''.obs;
  var position = ''.obs;
  var max = 0.0.obs;
  var value = 0.0.obs;
  BuildContext? context = Get.context!;
  bool isFound = false;
  bool isRepeatModeEnabled = false;
  bool isLoadingAudio = false;
  String? path_2;
  double progress = 0.0;
  int selectItem = 0;
  String name = "مشاري العفاسي";
  String id = "001";
  int seconds = 0;
  String image = "assets/images/masari.jpg";
  String surah_name = "سورة الفاتحة";
  String url = "https://server8.mp3quran.net/afs/";
  String surah_url = "https://server8.mp3quran.net/afs/001.mp3";
  bool status = true;
  int stepCounter = 0;
  String marge = "مشاري العفاسي-سورة الفاتحة.mp3";

  changeIndex(int index) {
    selectItem = index;
    name = Data.reciters[index]['name2'];
    image = Data.reciters[index]['image'];
    url = Data.reciters[index]['url'];
    surah_url = "$url$id.mp3";
    update();
  }

  skip() {
    if (Data.surah_number[stepCounter] != "114") {
      stepCounter++;
      id = Data.surah_number[stepCounter];
      surah_name = Data().surahs[stepCounter];
      player.setAudioSource(
        AudioSource.uri(
          Uri.parse("$url$id.mp3"),
        ),
      );
      update();
    }
  }

  previous() {
    if (Data.surah_number[stepCounter] != "001") {
      stepCounter--;
      id = Data.surah_number[stepCounter];
      surah_name = Data().surahs[stepCounter];
      player.setAudioSource(
        AudioSource.uri(
          Uri.parse("$url$id.mp3"),
        ),
      );
      update();
    }
  }

  changeName(int index) {
    surah_name = Data().surahs[index];
    surah_url = "$url${Data.surah_number[index]}.mp3";
    id = Data.surah_number[index];
    marge = "$name-$surah_name.mp3";
    playSong();
    update();
  }

  check() async {
    status = await checkInternet();
    if (status) {
      player.play();
      update();
    } else {
      showAwesomeDialog(
          context: context,
          description: "تحقق من الاتصال بالانترنت !",
          dialogType: DialogType.info,
          btnOkOnPress: () => Get.delete());
      update();
    }
    update();
  }

  checkPlaying() async {
    status = await checkInternet();
    if (status) {
      await playAudioFromUrl();
    } else {
      showAwesomeDialog(
          context: context,
          description: "تحقق من الاتصال بالانترنت !",
          dialogType: DialogType.info,
          btnOkOnPress: () => Get.delete());
    }
  }

  playAudioFromUrl() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
      update();
    } else {
      player.play();
      isPlaying = true;
      update();
    }
    update();
  }

  updatePosition() {
    player.durationStream.listen((d) {
      duration.value = d.toString();
      max.value = d!.inSeconds.toDouble();
    });
    player.positionStream.listen((p) {
      position.value = p.toString();
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(second) {
    seconds = second;
    var duration = Duration(seconds: second);
    player.seek(duration);
  }

  Future<void> playSong() async {
    try {
      await player.setAudioSource(
        AudioSource.uri(
          Uri.parse(surah_url),
          tag: MediaItem(
              id: "1",
              title: surah_name,
              album: name,
              playable: true,
              artUri: Uri.parse(
                  "https://images.unsplash.com/photo-1542816417-0983c9c9ad53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")),
        ),
      );
      player.play();
      updatePosition();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
