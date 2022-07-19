import 'dart:convert';

List<PendonorModel> pendonorModelFromJson(String str) => List<PendonorModel>.from(json.decode(str).map((x) => PendonorModel.fromJson(x)));

String pendonorModelToJson(List<PendonorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendonorModel {
  PendonorModel({
    this.id,
    this.namaPendonor,
    this.emailPendonor,
    this.alamatPendonor,
    this.kotaPendonor,
    this.usiaPendonor,
    this.jenisKelaminPendonor,
    this.beratBadanPendonor,
    this.golonganDarahPendonor,
    this.rhesusDarahPendonor,
    this.tanggalNegatifPendonor,
    this.mendapatkanTransfusiPendonor,
    this.sudahDivaksinPendonor,
    this.namaVaksinPendonor,
    this.dosisVaksinPendonor,
    this.penyakitBeratPendonor,
  });

  String? id;
  String? namaPendonor;
  String? emailPendonor;
  String? alamatPendonor;
  String? kotaPendonor;
  String? usiaPendonor;
  String? jenisKelaminPendonor;
  String? beratBadanPendonor;
  String? golonganDarahPendonor;
  String? rhesusDarahPendonor;
  String? tanggalNegatifPendonor;
  String? mendapatkanTransfusiPendonor;
  String? sudahDivaksinPendonor;
  String? namaVaksinPendonor;
  String? dosisVaksinPendonor;
  String? penyakitBeratPendonor;

  factory PendonorModel.fromJson(Map<String, dynamic> json) => PendonorModel(
    id: json["_id"],
    namaPendonor: json["namaPendonor"],
    emailPendonor: json["emailPendonor"],
    alamatPendonor: json["alamatPendonor"],
    kotaPendonor: json["kotaPendonor"],
    usiaPendonor: json["usiaPendonor"],
    jenisKelaminPendonor: json["jenisKelaminPendonor"],
    beratBadanPendonor: json["beratBadanPendonor"],
    golonganDarahPendonor: json["golonganDarahPendonor"],
    rhesusDarahPendonor: json["rhesusDarahPendonor"],
    tanggalNegatifPendonor: json["tanggalNegatifPendonor"],
    mendapatkanTransfusiPendonor: json["mendapatkanTransfusiPendonor"],
    sudahDivaksinPendonor: json["sudahDivaksinPendonor"],
    namaVaksinPendonor: json["namaVaksinPendonor"],
    dosisVaksinPendonor: json["dosisVaksinPendonor"],
    penyakitBeratPendonor: json["penyakitBeratPendonor"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "namaPendonor": namaPendonor,
    "emailPendonor": emailPendonor,
    "alamatPendonor": alamatPendonor,
    "kotaPendonor": kotaPendonor,
    "usiaPendonor": usiaPendonor,
    "jenisKelaminPendonor": jenisKelaminPendonor,
    "beratBadanPendonor": beratBadanPendonor,
    "golonganDarahPendonor": golonganDarahPendonor,
    "rhesusDarahPendonor": rhesusDarahPendonor,
    "tanggalNegatifPendonor": tanggalNegatifPendonor,
    "mendapatkanTransfusiPendonor": mendapatkanTransfusiPendonor,
    "sudahDivaksinPendonor": sudahDivaksinPendonor,
    "namaVaksinPendonor": namaVaksinPendonor,
    "dosisVaksinPendonor": dosisVaksinPendonor,
    "penyakitBeratPendonor": penyakitBeratPendonor,
  };
}
