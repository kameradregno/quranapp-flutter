import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/model/doadetailmodel.dart';
import 'package:quran_app/model/doamodel.dart';

class DoaRepository {
  Future<List<Doa>> getListDoa() async {
    String data = await rootBundle.loadString('assets/data/list-doa.json');

    return doaFromJson(data);
  }

   Future<DoaDetailModel> getListDetailDoa(String id_doa) async {
    String data =
        await rootBundle.loadString('assets/data/list-detail-doa.json');

    List<dynamic> jsonData = jsonDecode(data);

    int? intIdDzikir = int.tryParse(id_doa);

    if (intIdDzikir != null) {
      var entry = jsonData.firstWhere(
        (element) => element['nomor'] == intIdDzikir,
        orElse: () => null,
      );
      if (entry != null) {
        return DoaDetailModel.fromJson(entry);
      } else {
        throw Exception("Couldn't found entry for id_doa : $id_doa");
      }
    } else {
      throw Exception("id_doa $id_doa is not valid");
    }
  }
}