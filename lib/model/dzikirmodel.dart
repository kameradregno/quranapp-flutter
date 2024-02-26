import 'dart:convert';

List<Dzikir> dzikirFromJson(String str) => List<Dzikir>.from(
      json.decode(str).map(
            (x) => Dzikir.fromJson(x),
          ),
    );

class Dzikir {
  int? nomor;
  String? name;

  Dzikir({this.nomor, this.name});

  Dzikir.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['name'] = this.name;
    return data;
  }
}