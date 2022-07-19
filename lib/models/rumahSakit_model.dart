class RumahSakitData {
  final List<RumahSakitModel> rumahSakit = [
    RumahSakitModel(key:"RS Sardjito Yogyakarta",value:"1"),
    RumahSakitModel(key:"RSPAD Gatot Soebroto Jakarta",value:"2"),
    RumahSakitModel(key:"RS Dokter Hasan Sadikin Bandung",value:"3"),
    RumahSakitModel(key:"UDD PMI Semarang",value:"4"),
    RumahSakitModel(key:"RS UNAIR Surabaya",value:"5"),
  ];
}

class RumahSakitModel {
  final String? key;
  final String? value;

  RumahSakitModel({this.key, this.value});
}