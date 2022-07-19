// import 'package:dio/dio.dart' as d;
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../models/pendonor_model.dart';
//
// class AddPendonorCtrl extends GetxController {
//   TextEditingController? namaPendonorCtrl = TextEditingController();
//   TextEditingController? emailPendonorCtrl = TextEditingController();
//   TextEditingController? alamatPendonorCtrl = TextEditingController();
//   TextEditingController? kotaPendonorCtrl = TextEditingController();
//   TextEditingController? usiaPendonorCtrl = TextEditingController();
//   TextEditingController? jenisKelaminPendonorCtrl = TextEditingController();
//   TextEditingController? beratBadanPendonorCtrl = TextEditingController();
//   TextEditingController? golonganDarahPendonorCtrl = TextEditingController();
//   TextEditingController? rhesusDarahpendonorCtrl = TextEditingController();
//   TextEditingController? tanggalNegatifCtrl = TextEditingController();
//   TextEditingController? mendapatkanTransfusiPendonorCtrl = TextEditingController();
//   TextEditingController? sudahDivaksinPendonorCtrl = TextEditingController();
//   TextEditingController? namaVaksinPendonorCtrl = TextEditingController();
//   TextEditingController? dosisVaksinPendonorCtrl = TextEditingController();
//   TextEditingController? penyakitBeratPendonorCtrl = TextEditingController();
//   List<PendonorModel> pendonorList = <PendonorModel>[];
//   Dio dio = new Dio();
//   String baseUrl = "https://capstone-pk.herokuapp.com";
//   PendonorModel pendonorModel = PendonorModel();
//   // final isPendonorUploading = false.obs;
//
//   void addPendonorInList() {
//     PendonorModel pendonorModel = PendonorModel(
//       namaPendonor: namaPendonorCtrl?.text,
//       emailPendonor: emailPendonorCtrl?.text,
//       alamatPendonor: alamatPendonorCtrl?.text,
//       kotaPendonor: kotaPendonorCtrl?.text,
//       usiaPendonor: usiaPendonorCtrl?.text,
//       jenisKelaminPendonor: jenisKelaminPendonorCtrl?.text,
//       beratBadanPendonor: beratBadanPendonorCtrl?.text,
//       golonganDarahPendonor: golonganDarahPendonorCtrl?.text,
//       rhesusDarahPendonor: rhesusDarahpendonorCtrl?.text,
//       tanggalNegatifPendonor: tanggalNegatifCtrl?.text,
//       mendapatkanTransfusiPendonor: mendapatkanTransfusiPendonorCtrl?.text,
//       sudahDivaksinPendonor: sudahDivaksinPendonorCtrl?.text,
//       namaVaksinPendonor: namaVaksinPendonorCtrl?.text,
//       dosisVaksinPendonor: dosisVaksinPendonorCtrl?.text,
//       penyakitBeratPendonor: penyakitBeratPendonorCtrl?.text
//     );
//
//     pendonorList.add(pendonorModel);
//     pendonorList.forEach((pendonor) {
//       print('${pendonor.namaPendonor}');
//     });
//
//     update();
//   }
//
//   bool isUploading = false;
//
//   void postPendonorToDb() {
//     isUploading = true;
//     update();
//     postingPendonorToDb();
//   }
//
//   void postingPendonorToDb() {
//     PendonorModel pendonorModel = PendonorModel(
//       namaPendonor: namaPendonorCtrl?.text,
//     );
//     Future.delayed(Duration(seconds: 2)).then((_) {
//       pendonorList.add(pendonorModel);
//       pendonorList.forEach((pendonor) {
//         print('${pendonor.namaPendonor}');
//       });
//       isUploading = false;
//       showSnackBar();
//       update();
//       resetUi();
//     });
//   }
//
//   void showSnackBar() {
//     Get.snackbar('Data Terupload', '', snackPosition: SnackPosition.BOTTOM);
//   }
//
//   resetUi() {
//     namaPendonorCtrl?.text = '';
//     emailPendonorCtrl?.text = '';
//     alamatPendonorCtrl?.text = '';
//     kotaPendonorCtrl?.text = '';
//     usiaPendonorCtrl?.text = '';
//     jenisKelaminPendonorCtrl?.text = '';
//     beratBadanPendonorCtrl?.text = '';
//     golonganDarahPendonorCtrl?.text = '';
//     rhesusDarahpendonorCtrl?.text = '';
//     tanggalNegatifCtrl?.text = '';
//     mendapatkanTransfusiPendonorCtrl?.text = '';
//     sudahDivaksinPendonorCtrl?.text = '';
//     namaVaksinPendonorCtrl?.text = '';
//     dosisVaksinPendonorCtrl?.text = '';
//     penyakitBeratPendonorCtrl?.text = '';
//   }
//
//   postPendonorToMongoDB() async {
//     String apiUrl = "$baseUrl/calonPendonor/createCalonPendonor";
//     pendonorModel.namaPendonor = namaPendonorCtrl?.text!!;
//     pendonorModel.emailPendonor = emailPendonorCtrl?.text!;
//     pendonorModel.alamatPendonor = alamatPendonorCtrl?.text;
//     pendonorModel.kotaPendonor = kotaPendonorCtrl?.text;
//     pendonorModel.usiaPendonor = usiaPendonorCtrl?.text;
//     pendonorModel.jenisKelaminPendonor = jenisKelaminPendonorCtrl?.text;
//     pendonorModel.beratBadanPendonor = beratBadanPendonorCtrl?.text;
//     pendonorModel.golonganDarahPendonor = golonganDarahPendonorCtrl?.text;
//     pendonorModel.rhesusDarahPendonor = rhesusDarahpendonorCtrl?.text;
//     pendonorModel.tanggalNegatifPendonor = tanggalNegatifCtrl?.text;
//     pendonorModel.mendapatkanTransfusiPendonor = mendapatkanTransfusiPendonorCtrl?.text;
//     pendonorModel.sudahDivaksinPendonor = sudahDivaksinPendonorCtrl?.text;
//     pendonorModel.namaVaksinPendonor = namaVaksinPendonorCtrl?.text;
//     pendonorModel.dosisVaksinPendonor = dosisVaksinPendonorCtrl?.text;
//     pendonorModel.penyakitBeratPendonor = penyakitBeratPendonorCtrl?.text;
//     try {
//       d.Response response = await dio.post(apiUrl, data: pendonorModel.toJson());
//       if(response.statusCode==200 || response.statusCode==201){
//         resetUi();
//         showSnackBar();
//         return response;
//       }
//     } catch (e) {}
//   }
// }
