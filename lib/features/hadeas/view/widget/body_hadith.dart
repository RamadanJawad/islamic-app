import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/hadeas/controller/hadith_controller.dart';

class BodyHadith extends StatelessWidget {
  const BodyHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(5),
          child: AnimationLimiter(
            child: ListView.builder(
                itemCount: controller.item.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: InkWell(
                          onTap: () {
                            controller.onClickItem(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: ManagerHeight.h6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(ManagerRadius.r10)),
                            width: double.infinity,
                            height: ManagerHeight.h70,
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Image.asset(
                                    ManagerAssets.icon,
                                    width: ManagerWidth.w40,
                                    height: ManagerHeight.h40,
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    indent: 6.r,
                                    endIndent: 6.r,
                                  ),
                                  Text(
                                    "${controller.item[index]['name']}",
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s18,
                                        color: ManagerColors.black),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      controller.onClickItem(index);
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                      size: ManagerIconSize.s20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
