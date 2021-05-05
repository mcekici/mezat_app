// To parse this JSON data, do
//
//     final muzayede = muzayedeFromJson(jsonString);

import 'dart:convert';

List<Muzayede> muzayedeFromJson(String str) => List<Muzayede>.from(json.decode(str).map((x) => Muzayede.fromJson(x)));

String muzayedeToJson(List<Muzayede> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Muzayede {

  int muzayedeId;
  String sure;
  DateTime mTarih;
  String muzayedeAdi;
  int kullaniciId;
  int izlenme;
  String date;

  Muzayede({
    this.muzayedeId,
    this.sure,
    this.mTarih,
    this.muzayedeAdi,
    this.kullaniciId,
    this.izlenme,
    this.date,
  });

  factory Muzayede.fromJson(Map<String, dynamic> json) {
    return Muzayede(
      muzayedeId: json["muzayedeID"],
      sure: json["sure"],
      mTarih: DateTime.parse(json["mTarih"]),
      muzayedeAdi: json["muzayedeAdi"],
      kullaniciId: json["kullaniciID"],
      izlenme: json["izlenme"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
    "muzayedeID": muzayedeId,
    "sure": sure,
    "mTarih": mTarih.toIso8601String(),
    "muzayedeAdi": muzayedeAdi,
    "kullaniciID": kullaniciId,
    "izlenme": izlenme,
    "date": date,
  };
}
