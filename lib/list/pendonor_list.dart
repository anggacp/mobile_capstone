// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:plasmahero/API/service.dart';
// import 'package:plasmahero/list/pendonor_template.dart';
// import 'package:plasmahero/pages/detail_pendonor.dart';
//
// import '../controller/add_pendonor_controller.dart';
// import '../controller/display_controller.dart';
// import '../models/pendonor_model.dart';
//
// class PendonorList extends StatefulWidget {
//   const PendonorList ({Key ? key}) : super(key: key);
//
//   @override
//   State<PendonorList> createState() => _PendonorListState();
// }
//
// class _PendonorListState extends State<PendonorList> {
//   final displayCtrl = Get.find<DisplayCtrl>();
//   late final PendonorModel? pendonorModel;
//   PendonorList({this.pendonorModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddPendonorCtrl>(
//         builder: (_) =>
//         displayCtrl.isLoading
//             ? Center(child: CircularProgressIndicator())
//             : displayCtrl.displayPendonorList.length == 0
//             ? Center(child: Text('Tidak Ada Pendonor'))
//             : ListView.builder(
//             shrinkWrap: true,
//             itemCount: displayCtrl.displayPendonorList.length,
//             itemBuilder: (context, index) {
//               PendonorModel pendonorModel =
//               displayCtrl.displayPendonorList[index];
//               return Card (
//                 child: ListTile(
//                   title: Text(
//                       pendonorModel.namaPendonor ?? "Tidak Ada Pendonor"
//                   ),
//                   subtitle: Text(pendonorModel.emailPendonor ?? 'Pendonor Detail'),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailPendonor(pendonorModel)));
//                     },
//                 ),
//               );
//             }
//
//         )
//     );
//   }
//
// }
