import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/features/quran/controller/tabs_controller.dart';
import 'package:islamic_app/features/quran/model/quran.dart';
import 'package:islamic_app/features/quran/model/tafseer.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabsController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdown(
              borderSide: const BorderSide(color: ColorCode.mainColor),
              hintText: 'اختر السورة',
              listItemStyle: const TextStyle(
                  fontFamily: "ibm", color: ColorCode.mainColor),
              selectedStyle: const TextStyle(fontFamily: "ibm"),
              items: Data().surahs,
              hintStyle: const TextStyle(fontFamily: "ibm"),
              controller: controller.jobRoleDropdownCtrl,
              borderRadius: BorderRadius.circular(10).r,
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
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300),
                        child: Text(
                          versesAndTafseer[index],
                          style: TextStyle(fontFamily: "ibm", fontSize: 15.sp),
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
