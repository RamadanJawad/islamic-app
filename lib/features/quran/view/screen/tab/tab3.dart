import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/resources/color.dart';
import 'package:islamic_app/core/data/data.dart';
import 'package:islamic_app/core/resources/manager_colors.dart';
import 'package:islamic_app/core/resources/manager_fonts.dart';
import 'package:islamic_app/core/resources/manager_sizes.dart';
import 'package:islamic_app/core/resources/manager_styles.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabsController());
    return Scaffold(
      backgroundColor: ManagerColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdown(
              borderSide: const BorderSide(color: ColorCode.mainColor),
              hintText: 'اختر السورة',
              listItemStyle: getRegularTextStyle(
                  fontSize: ManagerFontSize.s15,
                  color: ManagerColors.mainColor),
              selectedStyle: getRegularTextStyle(
                  fontSize: ManagerFontSize.s15,
                  color: ManagerColors.subTitleColor),
              items: Data().surahs,
              hintStyle: getRegularTextStyle(
                  fontSize: ManagerFontSize.s15,
                  color: ManagerColors.subTitleColor),
              controller: controller.jobRoleDropdownCtrl,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              onChanged: (select) {
                controller.onChange(select);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller
                  .displayVersesAndInterpretations(controller.selectedItem),
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.hasData) {
                  final versesAndTafseer = snapshot.data!;
                  return ListView.builder(
                    itemCount: versesAndTafseer.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r10),
                            color: Colors.white),
                        child: Text(
                          versesAndTafseer[index],
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s15,
                              color: ManagerColors.black),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error occurred while loading data.'),
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
