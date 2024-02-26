import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:quran_app/model/ayahmodel.dart';
import 'package:quran_app/model/surahmodel.dart';

class QuranRepository {
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');

    return surahFromJson(data);
  }

  Future<AyahModel> getListAyah(String id_surah) async {
    String url = 'https://equran.id/api/surat/$id_surah';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("Error");
  }
}
