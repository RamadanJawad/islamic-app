import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.onPressedCopy,
      this.onPressedShare});

  final String title;
  final String subTitle;
  final void Function()? onPressedCopy;
  final void Function()? onPressedShare;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ManagerRadius.r16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onPressedCopy,
                icon: Icon(
                  Icons.bookmarks,
                  color: ManagerColors.grey,
                ),
              ),
              Text(
                title,
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColors.black),
              ),
              IconButton(
                onPressed: onPressedShare,
                icon: Icon(
                  Icons.share,
                  color: ManagerColors.grey,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                color: ManagerColors.backgroundColor),
            child: Text(
              textAlign: TextAlign.center,
              subTitle,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
