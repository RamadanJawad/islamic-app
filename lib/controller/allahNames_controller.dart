import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllahNamesController extends GetxController {
  List data = [];
  readNames() async {
    final String response =
        await rootBundle.loadString('assets/json/names_allah.json');
    data = json.decode(response);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readNames();
  }
}
