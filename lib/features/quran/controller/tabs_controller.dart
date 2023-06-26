import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/features/quran/model/quran.dart';
import 'package:islamic_app/features/quran/model/tafseer.dart';
import 'package:pdfx/pdfx.dart';

class TabsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final jobRoleDropdownCtrl = TextEditingController();
  String selectedItem = '';
  int selectedIndex = 0;
  static List<String> items = Data().surahs;
  late TabController tabController;
  List<Quran> quran = [];
  List<Tafseer> tafsir = [];
  List data = [];
  final pdfControllerPinch = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
  );

  void selectItem(int index) {
    selectedIndex = index;
    update();
  }

  onChange(select) async {
    selectedItem = select;
    update();
  }

  Future<List<String>> displayVersesAndInterpretations(
      String selectedSurah) async {
    quran = await readQuran();
    tafsir = await readTafseer();
    Quran? selectedQuranSurah;
    for (Quran quran in quran) {
      if ("سورة ${quran.name}" == selectedSurah) {
        selectedQuranSurah = quran;
        break;
      }
    }

    if (selectedQuranSurah != null) {
      List<String> versesAndTafseer = [];
      for (Ayahs ayah in selectedQuranSurah.ayahs!) {
        String verse = 'الآية رقم ${ayah.num}: ﴿${ayah.text}﴾';
        for (Tafseer tafseer in tafsir) {
          if (tafseer.sura == int.parse(selectedQuranSurah.num!) &&
              tafseer.aya == int.parse(ayah.num!)) {
            String tafseerText = 'تفسير الآية: ${tafseer.text}\n';
            versesAndTafseer.add(verse);
            versesAndTafseer.add(tafseerText);
            break;
          }
        }
      }
      return versesAndTafseer;
    } else {
      print('Selected surah not found!');
      return [];
    }
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
