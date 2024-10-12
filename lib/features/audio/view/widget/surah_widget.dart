import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

class SurahWidget extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final String text;
  const SurahWidget(
      {super.key, required this.index, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
        width: double.infinity,
        height: ManagerHeight.h60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[100]!,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 1),
            ],
            borderRadius: BorderRadius.circular(ManagerRadius.r10)),
        child: Row(
          children: [
            Container(
              width: ManagerWidth.w36,
              height: ManagerHeight.h36,
              decoration: BoxDecoration(
                  color: const Color(0xffF1EEE5),
                  borderRadius: BorderRadius.circular(ManagerRadius.r10)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.play_fill,
                  color: ColorCode.mainColor,
                  size: ManagerIconSize.s20,
                ),
              ),
            ),
            SizedBox(
              width: ManagerWidth.w20,
            ),
            Text(
              text,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
