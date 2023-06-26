import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/features/subha/controller/tasabih_controller.dart';
import 'package:islamic_app/core/constant/color.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasabihController>(builder: (controller) {
      return Column(
        children: [
          Text(
            controller.selectedItem,
            style: TextStyle(
                fontFamily: "ibm",
                fontSize: 22.sp,
                color: ColorCode.secondaryColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: CustomDropdown.search(
                  borderSide:const BorderSide(color: ColorCode.mainColor),
                  hintText: ' قائمة التسابيح',
                  listItemStyle: const TextStyle(
                      fontFamily: "ibm", color: ColorCode.mainColor),
                  selectedStyle: const TextStyle(fontFamily: "ibm"),
                  items: controller.items,
                  hintStyle: const TextStyle(fontFamily: "ibm"),
                  controller: controller.jobRoleDropdownCtrl,
                  borderRadius: BorderRadius.circular(10).r,
                  onChanged: (select) {
                    controller.onChange(select);
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    controller.resetNumber();
                  },
                  child: const Icon(
                    Icons.restart_alt_rounded,
                    size: 45,
                    color: ColorCode.mainColor,
                  )),
            ],
          ),
        ],
      );
    });
  }
}
