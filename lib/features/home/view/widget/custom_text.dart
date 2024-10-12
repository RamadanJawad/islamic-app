import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: ManagerColors.greyLight,
            thickness: ManagerWidth.w1,
            endIndent: 8,
            indent: 10,
          ),
        ),
        Text(
          text,
          style: getBoldTextStyle(
              fontSize: ManagerFontSize.s15, color: ManagerColors.black),
        ),
        Expanded(
          child: Divider(
            color: ManagerColors.greyLight,
            thickness: ManagerWidth.w1,
            endIndent: 10,
            indent: 8,
          ),
        ),
      ],
    );
  }
}
