import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class QuranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TextEditingController textController;
  List item2 = [];
  late var data;
  late TextStyle style;
  String selectedItem = '';
  late int initialPage;
  int? index;
  PdfControllerPinch pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/quran.pdf'));

 

  readData2() async {
    String response = await rootBundle.loadString("assets/json/tafseer.json");
    data = json.decode(response);
  }

  onChange(select) {
    selectedItem = select;
    item2 = data[selectedItem];
    update();
  }

  

  @override
  void onInit() {
    readData2();
    super.onInit();
  }
}
