import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamic_app/view/screen/icon/list_hadith.dart';

class HadithController extends GetxController {
  List item = [];
  readData() async {
    String data = await rootBundle.loadString("assets/json/hadith_nawawi.json");
    item = json.decode(data);
    update();
  }
  onClickItem(int index){
    Get.to(
        () =>ListHadith(name: item[index]['name'],hadith: item[index]['hadith'],id:item[index]['id']),
        transition: Transition.fade);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readData();
  }
}
