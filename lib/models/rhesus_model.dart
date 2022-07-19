class RhesusData {
  final List<RhesusModel> rhesus = [
    RhesusModel(key:"Negatif",value:"Negatif"),
    RhesusModel(key:"Positif",value:"Positif"),
    RhesusModel(key:"Tidak Tahu",value:"Tidak Tahu"),
  ];
}

class RhesusModel {
  final String? key;
  final String? value;

  RhesusModel({this.key, this.value});
}