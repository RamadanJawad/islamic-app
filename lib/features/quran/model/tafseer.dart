import 'dart:convert';

import 'package:flutter/services.dart';

class Tafseer {
  int? aya;
  int? index;
  int? sura;
  String? text;

  Tafseer({this.aya, this.index, this.sura, this.text});

  Tafseer.fromJson(Map<String, dynamic> json) {
    aya = json['aya'];
    index = json['index'];
    sura = json['sura'];
    text = json['text'];
  }
}

Future<List<Tafseer>> readTafseer() async {
  String response = await rootBundle.loadString("assets/json/tafsir.json");
  final jsonList = jsonDecode(response) as List<dynamic>;
  return jsonList.map((json) => Tafseer.fromJson(json)).toList();
}
