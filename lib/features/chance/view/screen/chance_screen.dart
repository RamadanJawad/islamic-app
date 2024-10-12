import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/chance/view/widget/body_chance.dart';

class ChanceScreen extends StatelessWidget {
  const ChanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            "فرص ذهبية",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22, color: ManagerColors.black),
          ),
        ),
        body: const BodyChance(),
      ),
    );
  }
}
