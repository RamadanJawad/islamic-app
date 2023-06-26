import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:islamic_app/features/audio/view/widget/common.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/awesome_dialog.dart';
import 'package:islamic_app/core/functions/check_internet.dart';
import 'package:islamic_app/core/functions/snackbar.dart';
import 'package:islamic_app/data/data.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:just_audio_background/just_audio_background.dart';

class AudioController extends GetxController {
  bool isPlaying = false;
  late AudioPlayer player;
  BuildContext? context = Get.context!;
  bool isFound = false;
  bool isRepeatModeEnabled = false;
  bool isLoadingAudio = false;
  Dio dio = Dio();
  String? path_2;
  double progress = 0.0;
  int selectItem = 0;
  String name = "مشاري العفاسي";
  String id = "001";
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

  releaseMode() {
    isRepeatModeEnabled = !isRepeatModeEnabled;
    update();
    if (isRepeatModeEnabled) {
      player.setLoopMode(LoopMode.one);
    } else {
      player.setLoopMode(LoopMode.off);
    }
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
          tag: MediaItem(
            id: '1',
            album: name,
            title: surah_name,
            artUri: Uri.parse(
                "https://images.unsplash.com/photo-1542816417-0983c9c9ad53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
          ),
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
          tag: MediaItem(
            id: '1',
            album: name,
            title: surah_name,
            artUri: Uri.parse(
                "https://images.unsplash.com/photo-1542816417-0983c9c9ad53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
          ),
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
    init();
    update();
  }

  Future<void> startDownloading(String fileName) async {
    isLoadingAudio = true;
    update();
    showSnackBar(context!, "جاري تحميل السورة ...", Colors.grey);
    final response = await dio.download(
      surah_url.toString(),
      "$path_2/$fileName",
      onReceiveProgress: (recivedBytes, totalBytes) {
        progress = recivedBytes / totalBytes;
        update();
      },
    );
    if (response.statusCode == 200) {
      isLoadingAudio = false;
      isFound = true;
      progress = 0.0;
      update();
      showSnackBar(context!, "تم تحميل السورة بنجاح ", Colors.green[400]!);
    } else {
      showSnackBar(
          context!, "فشل التحميل , يرجى المحاولة مرى اخرى", Colors.red[400]!);
    }
  }

  Future<void> initPatForm() async {
    Future.delayed(const Duration(seconds: 1), _setPath);
  }

  void _setPath() async {
    final savedDir = Directory("/storage/emulated/0/download");
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    path_2 = savedDir.path;
  }

  checkPlaying() async {
    status = await checkInternet();
    String filePath = "/storage/emulated/0/download/$marge";
    isFound = await File(filePath).exists();
    if (status) {
      if (isFound) {
        await playAudioFromDevice();
      } else {
        await playAudioFromUrl();
      }
    } else {
      if (isFound) {
        await playAudioFromDevice();
      } else {
        showAwesomeDialog(
            context: context,
            description: "تحقق من الاتصال بالانترنت !",
            dialogType: DialogType.info,
            btnOkOnPress: () => Get.delete());
      }
    }
  }

  playAudioFromDevice() {
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

  Stream<PositionData> get positionDataStream =>
      rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  init() async {
    String filePath = "/storage/emulated/0/download/$marge";
    isFound = await File(filePath).exists();
    if (isFound) {
      await player.setAudioSource(
        AudioSource.file(
          "/storage/emulated/0/download/$marge",
          tag: MediaItem(
            id: '1',
            album: name,
            title: surah_name,
            artUri: Uri.parse(
                "https://images.unsplash.com/photo-1542816417-0983c9c9ad53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
          ),
        ),
      );
    } else {
      await player.setAudioSource(
        AudioSource.uri(
          Uri.parse(surah_url),
          tag: MediaItem(
            id: '1',
            album: name,
            title: surah_name,
            artUri: Uri.parse(
                "https://images.unsplash.com/photo-1542816417-0983c9c9ad53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
          ),
        ),
      );
    }
  }

  getPath({String? name}) async {
    String filePath = "/storage/emulated/0/download/$name";
    isFound = await File(filePath).exists();
    status = await checkInternet();
    if (isFound) {
      showAwesomeDialog(
          context: context!,
          description: "لقد قمت بتحميل السورة من قبل ",
          dialogType: DialogType.info,
          btnOkOnPress: () => Get.delete());
      update();
    } else {
      if (status) {
        startDownloading(name!);
        update();
      } else {
        showAwesomeDialog(
            context: context,
            description: "تحقق من الاتصال بالانترنت !",
            dialogType: DialogType.info,
            btnOkOnPress: () => Get.delete());
      }
    }
    update();
  }

  @override
  void onInit() {
    player = AudioPlayer();
    super.onInit();
    initPatForm();
    init();
  }
}