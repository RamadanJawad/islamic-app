import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/data/ayah.dart';
import 'package:islamic_app/data/pages.dart';
import 'package:islamic_app/view/screen/tab/tab1.dart';
import 'package:islamic_app/view/screen/tab/tab2.dart';


class QuranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController textController;
  List item2 = [];
  final jobRoleDropdownCtrl = TextEditingController();
  int ayahNum = 0;
  late var data;
  String name = '';
  String juz = "";
  double size = 22;
  late TextStyle style;
  String selectedItem = '';
  late int currentIndex = 0;
  final List<Widget> screens = [
    const Tab1Screen(),
    const Tab2Screen(),
  ];
  late PageController pageController;

  

  String getVerseEndSymbol(int verseNumber, {bool arabicNumeral = true}) {
    var arabicNumeric = '';
    var digits = verseNumber.toString().split("").toList();

    if (!arabicNumeral) return '﴿${verseNumber.toString()}﴾';

    for (var e in digits) {
      if (e == "0") {
        arabicNumeric += "٠";
      }
      if (e == "1") {
        arabicNumeric += "۱";
      }
      if (e == "2") {
        arabicNumeric += "۲";
      }
      if (e == "3") {
        arabicNumeric += "۳";
      }
      if (e == "4") {
        arabicNumeric += "٤";
      }
      if (e == "5") {
        arabicNumeric += "٥";
      }
      if (e == "6") {
        arabicNumeric += "٦";
      }
      if (e == "7") {
        arabicNumeric += "٧";
      }
      if (e == "8") {
        arabicNumeric += "۸";
      }
      if (e == "9") {
        arabicNumeric += "۹";
      }
    }

    return '﴿$arabicNumeric﴾';
  }

  String getVerse(int surahNumber, int verseNumber) {
    String verse = '';
    for (var i in quranText) {
      if (i['surah_number'] == surahNumber &&
          i['verse_number'] == verseNumber) {
        verse = i['content'].toString();
        break;
      }
    }
    if (verse == "") {
      throw "No verse found with given surahNumber and verseNumber.\n\n";
    }
    return verse + (getVerseEndSymbol(verseNumber));
  }

  List getPageData(int pageNumber) {
    if (pageNumber < 1 || pageNumber > 604) {
      throw "Invalid page number. Page number must be between 1 and 604";
    }
    return pageData1[pageNumber - 1];
  }

  List<String> getVersesTextByPage(int pageNumber, int surah) {
    if (pageNumber > 604 || pageNumber <= 0) {
      throw "Invalid pageNumber";
    }
    List<String> verses = [];

    final pageData = getPageData(pageNumber);
    for (var data in pageData) {
      if (data["surah"] == surah) {
        for (int j = data["start"]; j <= data["end"]; j++) {
          juz = data['juz'];
          verses.add(getVerse(surah, j));
        }
      }
    }
    return verses;
  }
  int getVerseCountByPage(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    throw "Invalid page number. Page number must be between 1 and 604";
  }
  int totalVerseCount = 0;
  for (int i = 0; i < pageData1[pageNumber - 1].length; i++) {
    totalVerseCount +=
        int.parse(pageData1[pageNumber - 1][i]!["end"].toString());
  }
  return totalVerseCount;
}

  readData2() async {
    String response = await rootBundle.loadString("assets/json/tafseer.json");
    data = json.decode(response);
  }

 

  onChange(select) {
    selectedItem = select;
    item2 = data[selectedItem];
    update();
  }


  getData() {
    if (SharedPrefController().nameQuran != null) {
      name = SharedPrefController().nameQuran!;
    }
    update();
  }

  onClick(int index) {
    SharedPrefController().saveQuran(name: Data.surahs[index]);
    SharedPrefController().saveSurah(index: index + 1);
    name = SharedPrefController().nameQuran!;
    update();
  }

  savePage(int index) {
    SharedPrefController().savePage(index: index);
    update();
  }

  List<int> getSurahPages(int surahNumber) {
    if (surahNumber > 114 || surahNumber <= 0) {
      throw "Invalid surahNumber";
    }

    const pagesCount = 604;
    List<int> pages = [];
    for (int currentPage = 1; currentPage <= pagesCount; currentPage++) {
      final pageData = getPageData(currentPage);
      for (int j = 0; j < pageData.length; j++) {
        final currentSurahNum = pageData[j]['surah'];
        if (currentSurahNum == surahNumber) {
          pages.add(currentPage);
          break;
        }
      }
    }
    return pages;
  }

  @override
  void onInit() {
    readData2();
    super.onInit();
    style = TextStyle(fontSize: 22, fontFamily: "Uthman");
    pageController = PageController();
    getData();
    textController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
