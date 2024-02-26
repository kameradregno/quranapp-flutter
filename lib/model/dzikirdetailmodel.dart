class DzikirDetailModel {
  int? nomor;
  String? nama;
  List<DzikirDetail>? dzikirDetail;

  DzikirDetailModel({this.nomor, this.nama, this.dzikirDetail});

  DzikirDetailModel.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    nama = json['nama'];
    if (json['dzikir'] != null) {
      dzikirDetail = <DzikirDetail>[];
      json['dzikir'].forEach((v) {
        dzikirDetail!.add(new DzikirDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['nama'] = this.nama;
    if (this.dzikirDetail != null) {
      data['dzikirDetail'] = dzikirDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DzikirDetail {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? notes;
  String? fawaid;
  String? source;

  DzikirDetail(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  DzikirDetail.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    notes = json['notes'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['notes'] = this.notes;
    data['fawaid'] = this.fawaid;
    data['source'] = this.source;
    return data;
  }
}