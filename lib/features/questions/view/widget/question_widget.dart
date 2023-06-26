import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/features/questions/controller/question_controller.dart';
import 'package:islamic_app/features/questions/model/questions.dart';
import 'package:islamic_app/features/questions/view/widget/header_question.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderQuestion(
                number: question.number.toString(),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Text(
                question.question!,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.green,
                  value: controller.animation.value,
                  backgroundColor: Colors.grey,
                  strokeWidth: 5,
                ),
                Text(
                  "${(controller.animation.value * 30).round()}",
                  style: const TextStyle(fontFamily: "ibm"),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: question.options!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: controller.selectAnswerColor(index),
                                  width: 1.5.w),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade100,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 10),
                                )
                              ],
                            ),
                            child: InkWell(
                              onTap: !controller.isAnswered
                                  ? () {
                                      controller.checkAnswer(question, index);
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  Text("${index + 1}."),
                                  Text(
                                    question.options![index],
                                    style: TextStyle(
                                        fontFamily: "ibm", fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: controller
                                                .selectAnswerColor(index) ==
                                            Colors.transparent
                                        ? null
                                        : Icon(
                                            controller.getTheRightIcon(index),
                                            size: 16),
                                  ),
                                  Visibility(
                                    visible: controller.visiblePoll,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          value: question.poll![index] / 100,
                                          backgroundColor: Colors.grey,
                                          color: Colors.green,
                                        ),
                                        Text("${question.poll![index]}")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10).r),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              ImageUrl.choice,
                              width: 30.w,
                              height: 30.h,
                            ),
                            Text(
                              "حذف اجابتين",
                              style:
                                  TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 3,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showPoll();
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              ImageUrl.polling,
                              width: 30.w,
                              height: 30.h,
                            ),
                            Text(
                              "استطلاع رأي",
                              style:
                                  TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 3,
                      ),
                      InkWell(
                        onTap: () {
                          controller.resetTimer();
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              ImageUrl.timer,
                              width: 30.w,
                              height: 30.h,
                            ),
                            Text(
                              "اعادة المؤقت",
                              style:
                                  TextStyle(fontFamily: "ibm", fontSize: 16.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}