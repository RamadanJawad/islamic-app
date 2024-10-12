import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/audio/controller/audio_controller.dart';

class RecitersWidget extends StatelessWidget {
  const RecitersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(
      builder: (controller) {
        return SizedBox(
          height: ManagerHeight.h120,
          child: ListView.builder(
              itemCount: Data.reciters.length,
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
                    width: ManagerWidth.w76,
                    height: ManagerHeight.h120,
                    decoration: BoxDecoration(
                        color: controller.selectItem == index
                            ? ColorCode.mainColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(ManagerRadius.r16)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r16),
                          child: Image.asset(
                            Data.reciters[index]['image'],
                            width: ManagerWidth.w50,
                            fit: BoxFit.cover,
                            height: ManagerHeight.h50,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h4,
                        ),
                        Text(
                          Data.reciters[index]['name'],
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.noScaling,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: controller.selectItem == index
                                  ? Colors.white
                                  : Colors.black),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
