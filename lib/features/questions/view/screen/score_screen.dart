import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/questions/controller/question_controller.dart';
import 'package:islamic_app/features/questions/view/widget/score_widget.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionController());
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child: ScoreBody()),
      ),
    );
  }
}
