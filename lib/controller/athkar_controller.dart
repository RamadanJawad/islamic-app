import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/view/screen/icon/list_athkar.dart';

class AthkarController extends GetxController {
  List _items = [];
  late var data;
  Future<void> readData() async {
    final String response =
        await rootBundle.loadString('assets/json/athkar.json');
    data = await json.decode(response);
  }
  onClickItem(int index) {
    _items = data[Data.duaa[index]];
    Get.to(
        () => ListDataAthkar(
              name: Data.duaa[index],
              data: _items,
            ),
        transition: Transition.fade);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readData();
  }
}
