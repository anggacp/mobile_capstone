class KelaminData {
  final List<KelaminModel> kelamin = [
    KelaminModel(key:"Laki-laki",value:"Laki-laki"),
    KelaminModel(key:"Perempuan",value:"Perempuan"),
  ];
}

class KelaminModel {
  final String? key;
  final String? value;

  KelaminModel({this.key, this.value});
}