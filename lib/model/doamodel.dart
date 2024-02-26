import 'dart:convert';

List<Doa> doaFromJson(String str) => List<Doa>.from(
      json.decode(str).map(
            (x) => Doa.fromJson(x),
          ),
    );

class Doa {
  int? nomor;
  String? name;

  Doa({this.nomor, this.name});

  Doa.fromJson(Map<String, dynamic> json) {
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