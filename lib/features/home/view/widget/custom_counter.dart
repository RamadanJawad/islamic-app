import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter(
      {super.key,
      required this.counter,
      this.onPressedReply,
      this.onPressedAdd});

  final String counter;
  final void Function()? onPressedReply;
  final void Function()? onPressedAdd;

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
              Text(
                "عداد الصلاة على النبي",
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColors.black),
              ),
              IconButton(
                onPressed: onPressedReply,
                icon: Icon(
                  Icons.replay,
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
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "اللهم صل وسلم وبارك على نبينا محمد ﷺ",
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s20,
                      color: ManagerColors.black),
                ),
                SizedBox(
                  width: ManagerWidth.w70,
                  height: ManagerHeight.h60,
                  child: ElevatedButton(
                    onPressed: onPressedAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ManagerColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ManagerRadius.r100),
                      ),
                    ),
                    child: Text(
                      counter,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.mainColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
