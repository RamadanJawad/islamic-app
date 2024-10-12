import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/core/functions/copy_fun.dart';
import 'package:islamic_app/features/home/view/widget/custom_widget.dart';
import 'package:share_plus/share_plus.dart';

class BodyChance extends StatelessWidget {
  const BodyChance({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: Data.chance.length,
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
                    title: "الفرصة رقم ${index + 1}",
                    subTitle: Data.chance[index],
                    onPressedShare: () async {
                      await Share.share("${Data.chance[index]}");
                    },
                    onPressedCopy: () {
                      copyFunction(text: "${Data.chance[index]}");
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
