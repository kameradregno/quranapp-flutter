import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/model/dzikirdetailmodel.dart';
import 'package:quran_app/model/dzikirmodel.dart';

class DzikirRepository {
  Future<List<Dzikir>> getListDzikir() async {
    String data = await rootBundle.loadString('assets/data/list-dzikir.json');

    return dzikirFromJson(data);
  }

  Future<DzikirDetailModel> getListDetailDzikir(String id_dzikir) async {
    String data =
        await rootBundle.loadString('assets/data/list-detail-dzikir.json');

    List<dynamic> jsonData = jsonDecode(data);

    int? intIdDzikir = int.tryParse(id_dzikir);

    if (intIdDzikir != null) {
      var entry = jsonData.firstWhere(
        (element) => element['nomor'] == intIdDzikir,
        orElse: () => null,
      );
      if (entry != null) {
        return DzikirDetailModel.fromJson(entry);
      } else {
        throw Exception("Couldn't found entry for id_dzikir : $id_dzikir");
      }
    } else {
      throw Exception("id_dzikir $id_dzikir is not valid");
    }
  }
}
