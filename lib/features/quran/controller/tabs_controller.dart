import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class TabsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final jobRoleDropdownCtrl = TextEditingController();
  String selectedItem = '';
  int selectedIndex = 0;
  late TabController tabController;
  final pdfControllerPinch = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
  );


  void selectItem(int index) {
    selectedIndex = index;
    update();
  }

  onChange(select) {
    selectedItem = select;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
