import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/functions/location.dart';
import 'package:islamic_app/core/functions/snackbar.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/pray_time/controller/prayTime_controller.dart';
import 'package:islamic_app/core/constant/color.dart';
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
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (SharedPrefController().latitude == null &&
                    SharedPrefController().longitude == null) {
                  getLatAndLong();
                } else {
                  showSnackBar(
                      context, "تم تحديث أوقات الصلاة بنجاح", Colors.grey);
                }
              },
              icon: const Icon(Icons.my_location_sharp),
            )
          ],
          backgroundColor: ColorCode.mainColor,
          title: Text(
            "أوقات الصلاة",
            style: TextStyle(fontFamily: "ibm", fontSize: 20.sp),
          ),
        ),
        body: const BodyPrayTime(),
      ),
    );
  }
}
