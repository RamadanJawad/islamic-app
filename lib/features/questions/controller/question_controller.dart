import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/cache/cache.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/questions/data/questions.dart';
import 'package:islamic_app/features/questions/model/questions.dart';
import 'package:islamic_app/features/questions/view/screen/score_screen.dart';
import 'package:just_audio/just_audio.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int? selectIndex;
  int? correctAns;
  bool visible = false;
  bool isAnswered = false;
  int stars = 0;
  late AnimationController animationController;
  late Animation animation;
  RxInt questionNumber = 0.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  PageController pageController = PageController();
  Timer? timer;
  bool answerChecked = false;
  int numOfCorrectAns = 0;
  int numOfFilAns = 0;
  List<String> answers = [];
  CacheData cacheData = CacheData();
  bool visiblePoll = false;

  List<dynamic> questionLevel() {
    switch (cacheData.getQuestionLevel()) {
      case 1:
        return questionLevel1;
      case 2:
        return questionLevel2;
      case 3:
        return questionLevel3;
      case 4:
        return questionLevel4;
      default:
        return [];
    }
  }

  List<Question> _questions = [];

  List<Question> get questions => this._questions;

  updateLevel() {
    _questions = questionLevel()
        .map(
          (question) => Question(
              id: question['id'],
              question: question['question'],
              options: question['options'],
              answer: question['correct_answer'],
              number: question['number_question'],
              poll: question['poll']),
        )
        .toList();
  }

  printData() async {
    List data = await SharedPrefController()
        .getAnswersForLevel(CacheData().getQuestionLevel());
  }

  checkAnswer(Question question, int val) async {
    isAnswered = true;
    correctAns = question.answer!;
    selectIndex = val;
    if (correctAns == selectIndex) {
      audioPlayer.play();
      visible = true;
      answers.add(selectIndex.toString());
      numOfCorrectAns++;
      stars = SharedPrefController().getAllStarsPoint! + 3;
      animationController.stop();
      update();
      Future.delayed(const Duration(seconds: 3), () {
        nextQuestion();
      });
      SharedPrefController().saveAllStarsPoint(stars);
    } else {
      numOfFilAns++;
      stars = SharedPrefController().getAllStarsPoint! - 2;
      answers.add(selectIndex.toString());
      animationController.stop();
      update();
      Future.delayed(const Duration(seconds: 3), () {
        nextQuestion();
      });
      SharedPrefController()
          .saveAnswersForLevel(CacheData().getQuestionLevel(), answers);
    }
    SharedPrefController().saveAllStarsPoint(stars);
  }

  showPoll() {
    visiblePoll = true;
    update();
  }

  void nextQuestion() {
    if (questionNumber.value != _questions.length) {
      isAnswered = false;
      visible = false;
      visiblePoll = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
      animationController.reset();
      animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => const ScoreScreen());
    }
  }

  Color selectAnswerColor(val) {
    if (isAnswered) {
      if (val == correctAns) {
        return Colors.green;
      } else if (val == selectIndex && selectIndex != correctAns) {
        return Colors.red;
      }
    }
    return Colors.transparent;
  }

  IconData getTheRightIcon(val) {
    return selectAnswerColor(val) == Colors.red ? Icons.close : Icons.done;
  }

  void updateTheQnNum(int index) {
    questionNumber.value = index + 1;
  }

  void resetTimer() {
    animationController.stop();
    animationController.reset();
    animationController.forward().whenComplete(nextQuestion);
  }

  @override
  void onInit() {
    audioPlayer.setAsset("assets/sound/correct.mp3");
    updateLevel();
    animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    animationController.forward().whenComplete(nextQuestion);
    animation = Tween<double>(begin: 1, end: 0).animate(animationController)
      ..addListener(() {
        update();
      });
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
