class StokRhesusData {
  final List<StokRhesusModel> rhesus = [
    StokRhesusModel(key:"Positif",value:"_positif"),
    StokRhesusModel(key:"Negatif",value:"_negatif"),
  ];
}

class StokRhesusModel {
  final String? key;
  final String? value;

  StokRhesusModel({this.key, this.value});
}
