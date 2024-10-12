import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/home/controller/home_controller.dart';
import 'package:share_plus/share_plus.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "الصفحة الرئيسية",
          style: getBoldTextStyle(
              fontSize: ManagerFontSize.s20, color: ManagerColors.mainColor),
        ),
        const Spacer(),
        Container(
          width: ManagerWidth.w44,
          height: ManagerHeight.h44,
          margin: EdgeInsets.only(top: ManagerHeight.h4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r14)),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return IconButton(
                onPressed: () async {
                  Share.share(
                      "تطبيق أذكار المسلم \n https://play.google.com/store/apps/details?id=com.azker96.azker1196");
                },
                icon: const Icon(
                  Icons.ios_share_rounded,
                  color: Color.fromARGB(255, 150, 97, 0),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
