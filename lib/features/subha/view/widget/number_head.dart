import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';

class NumberHead extends StatelessWidget {
  const NumberHead({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    ManagerStrings.role,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s20,
                        color: ManagerColors.black),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: ManagerWidth.w80,
                    height: ManagerHeight.h40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                        border: Border.all(
                            width: ManagerWidth.w1,
                            color: ManagerColors.mainColor)),
                    child: Text("${controller.role}",
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s24,
                            color: ManagerColors.secondaryColor)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    ManagerStrings.total,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s20,
                        color: ManagerColors.black),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: ManagerWidth.w80,
                    height: ManagerHeight.h40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                        border: Border.all(
                            width: ManagerWidth.w1,
                            color: ManagerColors.mainColor)),
                    child: Text(
                      "${controller.value}",
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s24,
                          color: ManagerColors.secondaryColor),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );
    });
  }
}
