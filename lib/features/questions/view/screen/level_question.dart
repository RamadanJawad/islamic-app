import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/cache/cache.dart';
import 'package:islamic_app/core/constant/image_url.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/features/questions/controller/level_question.dart';
import 'package:islamic_app/features/questions/view/screen/question_view.dart';

import '../../../../core/functions/awesome_dialog.dart';

class LevelQuestion extends StatelessWidget {
  const LevelQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "كافة المستويات",
                      style: TextStyle(fontFamily: "ibm", fontSize: 20.sp),
                    ),
                    const Spacer(),
                    GetBuilder<LevelQuestionController>(
                      init: LevelQuestionController(),
                      builder: (controller) {
                        return Text(
                          SharedPrefController().getAllStarsPoint.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "ibm",
                              color: Colors.black,
                              fontSize: 15.sp),
                        );
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      ImageUrl.dollar,
                      width: 30.w,
                      height: 30.h,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(child:
                                GetBuilder<LevelQuestionController>(
                                    builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  if (SharedPrefController()
                                          .getAllStarsPoint! <=
                                      Data.stars[index]) {
                                    showAwesomeDialog(
                                        context: context,
                                        description:
                                            "هذا المستوى مغلق حاليا\nيجب احراز على الاقل ${Data.stars[index]}نجمة",
                                        dialogType: DialogType.info,
                                        btnOkOnPress: () => Get.delete());
                                  } else {
                                    CacheData cacheData = CacheData();
                                    cacheData.setQuestionLevel(index + 1);
                                    Get.to(() => QuestionView(
                                          index: index + 1,
                                        ));
                                  }
                                },
                                child: Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${Data.level[index]}",
                                        style: TextStyle(
                                            fontFamily: "ibm", fontSize: 17.sp),
                                      ),
                                      Icon(
                                        controller.star(index)!
                                            ? Icons.lock_open_rounded
                                            : Icons.lock_outline_rounded,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
