class GoldarData {
  final List<GoldarModel> goldar = [
    GoldarModel(key:"A",value:"A"),
    GoldarModel(key:"B",value:"B"),
    GoldarModel(key:"AB",value:"AB"),
    GoldarModel(key:"O",value:"O"),
  ];
}

class GoldarModel {
  final String? key;
  final String? value;

  GoldarModel({this.key, this.value});
}