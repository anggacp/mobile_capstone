class KotaData {
  final List<KotaModel> kota = [
    KotaModel(key:"Yogyakarta",value:"Yogyakarta"),
    KotaModel(key:"Jakarta",value:"Jakarta"),
    KotaModel(key:"Bandung",value:"Bandung"),
    KotaModel(key:"Semarang",value:"Semarang"),
    KotaModel(key:"Surabaya",value:"Surabaya"),
  ];
}

class KotaModel {
  final String? key;
  final String? value;

  KotaModel({this.key, this.value});
}