import 'dart:convert';

import 'package:flutter/services.dart';

class Quran {
  String? num;
  String? name;
  List<Ayahs>? ayahs;

  Quran({this.num, this.name, this.ayahs});

  Quran.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }
}

class Ayahs {
  String? num;
  String? text;

  Ayahs({this.num, this.text});

  Ayahs.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    text = json['text'];
  }
}

Future<List<Quran>> readQuran() async {
  String response = await rootBundle.loadString("assets/json/quran_clean.json");
  final jsonList = jsonDecode(response) as List<dynamic>;
  return jsonList.map((json) => Quran.fromJson(json)).toList();
}
