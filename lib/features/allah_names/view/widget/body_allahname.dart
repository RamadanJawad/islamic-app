import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';
import 'package:islamic_app/features/allah_names/controller/allahNames_controller.dart';
import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
import 'package:share_plus/share_plus.dart';

class AllahName extends StatelessWidget {
  const AllahName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllahNamesController>(
      builder: (controller) {
        return AnimationLimiter(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: CustomWidget(
                        title: controller.data[index]['name'],
                        subTitle: controller.data[index]['text'],
                        onPressedShare: () async {
                          await Share.share(
                              "${controller.data[index]['name']} \n${controller.data[index]['text']}");
                        },
                        onPressedCopy: () {
                          copyFunction(
                              text:
                                  "${controller.data[index]['name']} \n${controller.data[index]['text']}");
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
