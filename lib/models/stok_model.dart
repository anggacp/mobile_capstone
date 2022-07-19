class StokData {
  final List<StokModel> stok = [
    StokModel(key:"A",value:"stok_plasma_A"),
    StokModel(key:"B",value:"stok_plasma_B"),
    StokModel(key:"AB",value:"stok_plasma_AB"),
    StokModel(key:"O",value:"stok_plasma_O"),
  ];
}

class StokModel {
  final String? key;
  final String? value;

  StokModel({this.key, this.value});
}
