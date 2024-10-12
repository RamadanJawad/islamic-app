import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_assets.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/settings/controller/setting_controller.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/features/settings/view/widget/switch_button.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w4, vertical: ManagerHeight.h4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ManagerStrings.alert,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ManagerAssets.notification1,
                  width: ManagerWidth.w24,
                  height: ManagerHeight.h24,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.alertPrayer,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value1,
                  onChangeMethod: (value) {
                    controller.onChange1(value);
                    SharedPrefController().saveStatus1(status1: value);
                    controller.prayTimeNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ManagerAssets.notification2,
                  width: ManagerWidth.w24,
                  height: ManagerHeight.h24,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.alertMorning,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value2,
                  onChangeMethod: (value) {
                    controller.onChange2(value);
                    SharedPrefController().saveStatus2(status2: value);
                    controller.morningNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ManagerAssets.notification3,
                  width: ManagerWidth.w24,
                  height: ManagerHeight.h24,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.alertEvening,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value3,
                  onChangeMethod: (value) {
                    controller.onChange3(value);
                    SharedPrefController().saveStatus3(status3: value);
                    controller.nightNotification();
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  ManagerAssets.notification4,
                  width: ManagerWidth.w24,
                  height: ManagerHeight.h24,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                Text(
                  ManagerStrings.alertFriday,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black),
                ),
                const Spacer(),
                SwitchButton(
                  value: controller.value4,
                  onChangeMethod: (value) {
                    controller.onChange4(value);
                    SharedPrefController().saveStatus4(status4: value);
                    controller.fridayNotification();
                  },
                )
              ],
            ),
            SizedBox(
              height: ManagerHeight.h4,
            )
          ],
        ),
      );
    });
  }
}
