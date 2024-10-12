import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/location.dart';
import 'package:islamic_app/core/functions/snackbar.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/features/pray_time/view/widget/body_prayTime.dart';

class PrayTimeScreen extends StatelessWidget {
  const PrayTimeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PrayTimeController());
    checkLocation(context, controller);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (SharedPrefController().latitude == null &&
                    SharedPrefController().longitude == null) {
                  getLatAndLong(controller);
                } else {
                  showSnackBar(
                      context, "تم تحديث أوقات الصلاة بنجاح", Colors.grey);
                }
              },
              icon: const Icon(Icons.my_location_sharp),
            )
          ],
          backgroundColor: ManagerColors.backgroundColor,
          title: Text(
            "أوقات الصلاة",
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColors.black),
          ),
        ),
        body: const BodyPrayTime(),
      ),
    );
  }
}
