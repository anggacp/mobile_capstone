import 'dart:convert';

StokRumahSakitModel stokRumahSakitFromJson(String str) => StokRumahSakitModel.fromJson(json.decode(str));

String stokRumahSakitToJson(StokRumahSakitModel data) => json.encode(data.toJson());

class StokRumahSakitModel {
  StokRumahSakitModel({
    this.totalPlasma,
    this.stokPlasmaA,
    this.stokPlasmaB,
    this.stokPlasmaAB,
    this.stokPlasmaO,
  });

  int? totalPlasma;
  int? stokPlasmaA;
  int? stokPlasmaB;
  int? stokPlasmaAB;
  int? stokPlasmaO;

  factory StokRumahSakitModel.fromJson(Map<String, dynamic> json) => StokRumahSakitModel(
    totalPlasma: json["total_plasma"],
    stokPlasmaA: json["stok_plasma_A"],
    stokPlasmaB: json["stok_plasma_B"],
    stokPlasmaAB: json["stok_plasma_AB"],
    stokPlasmaO: json["stok_plasma_O"],
  );

  Map<String, dynamic> toJson() => {
    "total_plasma": totalPlasma,
    "stok_plasma_A": stokPlasmaA,
    "stok_plasma_B": stokPlasmaB,
    "stok_plasma_AB": stokPlasmaAB,
    "stok_plasma_O": stokPlasmaO,
  };
}