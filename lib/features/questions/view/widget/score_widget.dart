import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/questions/controller/question_controller.dart';
import 'package:islamic_app/features/questions/view/screen/level_question.dart';

class ScoreBody extends StatelessWidget {
  const ScoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              ImageUrl.badge,
              width: 120.w,
              height: 120.h,
            ),
            Text(
              SharedPrefController().getAllStarsPoint.toString(),
              style: TextStyle(
                  fontFamily: "ibm",
                  fontSize: 30.sp,
                  color: const Color(0xff7A6CF7)),
            ),
            Text(
              "نقاط",
              style: TextStyle(
                  fontFamily: "ibm", fontSize: 25.sp, color: Colors.black),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              child: Row(
                children: [
                  Image.asset(
                    ImageUrl.questions,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "العدد الكلي للأسئلة",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                  const Spacer(),
                  Text(
                    "10",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              child: Row(
                children: [
                  Image.asset(
                    ImageUrl.answers,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "الأسئلة المجاب عليها",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                  const Spacer(),
                  Text(
                    "${controller.numOfCorrectAns + controller.numOfFilAns}",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              child: Row(
                children: [
                  Image.asset(
                    ImageUrl.smiling,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "الاجابات الصحيحة",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                  const Spacer(),
                  Text(
                    controller.numOfCorrectAns.toString(),
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              child: Row(
                children: [
                  Image.asset(
                    ImageUrl.sad,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "الاجابات الخاطئة",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                  const Spacer(),
                  Text(
                    "${controller.numOfFilAns}",
                    style: TextStyle(
                        fontFamily: "ibm",
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Color(0xff7A6CF7))),
                icon: Image.asset(
                  ImageUrl.share,
                  width: 25.w,
                  height: 25.h,
                ),
                label: Text(
                  "شارك النتيجة",
                  style: TextStyle(fontFamily: "ibm", fontSize: 17.sp),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>const LevelQuestion());
                  Get.delete<QuestionController>();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xff7A6CF7)),
                child: Text(
                  "المستوى التالي",
                  style: TextStyle(fontFamily: "ibm", fontSize: 17.sp),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
