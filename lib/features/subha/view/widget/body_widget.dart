import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_strings.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return Column(
        children: [
          Text(
            controller.selectedItem,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s22,
                color: ManagerColors.secondaryColor),
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ManagerWidth.w205,
                child: CustomDropdown(
                  hintText: ManagerStrings.subhaDropDown,
                  listItemStyle: const TextStyle(
                      fontFamily: "Noor", color: ManagerColors.mainColor),
                  selectedStyle: const TextStyle(fontFamily: "Noor"),
                  items: controller.items,
                  hintStyle: const TextStyle(fontFamily: "Noor"),
                  controller: controller.jobRoleDropdownCtrl,
                  borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  onChanged: (select) {
                    controller.onChange(select);
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    controller.resetNumber();
                  },
                  child: Icon(
                    Icons.restart_alt_rounded,
                    size: ManagerIconSize.s44,
                    color: ManagerColors.mainColor,
                  )),
            ],
          ),
        ],
      );
    });
  }
}
