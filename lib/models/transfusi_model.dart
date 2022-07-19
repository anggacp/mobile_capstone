class TransfusiData {
  final List<TransfusiModel> transfusi = [
    TransfusiModel(key:"Iya",value:"Iya"),
    TransfusiModel(key:"Tidak",value:"Tidak"),
  ];
}

class TransfusiModel {
  final String? key;
  final String? value;

  TransfusiModel({this.key, this.value});
}