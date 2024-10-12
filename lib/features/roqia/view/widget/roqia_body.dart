import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';

import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
import 'package:share_plus/share_plus.dart';

class BodyRoqia extends StatelessWidget {
  const BodyRoqia({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: Data.roqia.length,
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
                    title: Data.roqia[index]['text2'],
                    subTitle: Data.roqia[index]['text1'],
                    onPressedShare: () async {
                      await Share.share(
                          "${Data.roqia[index]['text1']} \n ${Data.roqia[index]['text1']}");
                    },
                    onPressedCopy: () {
                      copyFunction(
                          text:
                              "${Data.roqia[index]['text1']} \n ${Data.roqia[index]['text1']}");
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
