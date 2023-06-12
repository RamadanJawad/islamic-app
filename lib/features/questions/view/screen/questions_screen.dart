import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/functions/awesome_dialog.dart';
import 'package:islamic_app/core/functions/dialog.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/questions/view/screen/level_question.dart';
import 'package:islamic_app/features/questions/view/screen/question_view.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            "ثقف عقلك",
            style: TextStyle(fontFamily: "ibm", fontSize: 20.sp),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                ImageUrl.questionImage,
                height: 300.h,
                width: 200.w,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LevelQuestion());
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: ColorCode.mainColor),
                  child: Text(
                    "ابدا المسابقة",
                    style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  onPressed: () {
                    showDialogQuiz();
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: ColorCode.mainColor),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.white,
                      foregroundColor: ColorCode.mainColor),
                  child: Text(
                    "شروط المسابقة",
                    style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showAwesomeDialog(
                        context: context,
                        description: "هل تريد اعادة المسابقة من جديد ؟",
                        dialogType: DialogType.warning,
                        btnCancelOnPress: () => Get.delete(),
                        btnOkOnPress: () {
                          SharedPrefController().clearQuestion();
                          Get.delete();
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: ColorCode.mainColor),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.white,
                      foregroundColor: ColorCode.mainColor),
                  child: Text(
                    "اعادة المسابقة",
                    style: TextStyle(fontFamily: "ibm", fontSize: 18.sp),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
