import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/questions/controller/question_controller.dart';
import 'package:islamic_app/features/questions/view/widget/question_widget.dart';
import 'package:lottie/lottie.dart';

class QuestionView extends StatelessWidget {
  final int index;

  const QuestionView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                        itemCount: controller.questions.length,
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          controller.updateTheQnNum(value);
                        },
                        itemBuilder: (context, index) {
                          return QuestionWidget(
                              question: controller.questions[index]);
                        }),
                    Visibility(
                      visible: controller.visible,
                      child: Lottie.asset("assets/json/confetti.json",
                          repeat: false,
                          reverse: false,
                          height: 300.h,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
