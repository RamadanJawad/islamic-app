import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key, required this.title, required this.imageUrl, this.onTap});

  final String title;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(ManagerRadius.r16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: ManagerWidth.w44,
              height: ManagerHeight.h44,
              fit: BoxFit.cover,
            ),
            Text(title,
                textAlign: TextAlign.center,
                textScaler: TextScaler.noScaling,
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.black))
          ],
        ),
      ),
    );
  }
}
