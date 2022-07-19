class DosisData {
  final List<DosisModel> dosis = [
    DosisModel(key:"1",value:"1"),
    DosisModel(key:"2",value:"2"),];
}

class DosisModel {
  final String? key;
  final String? value;

  DosisModel({this.key, this.value});
}