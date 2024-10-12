import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/roqia/view/widget/roqia_body.dart';

class RoqiaScreen extends StatelessWidget {
  const RoqiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            "الرقية الشرعية",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22, color: ManagerColors.black),
          ),
        ),
        body: const BodyRoqia(),
      ),
    );
  }
}
