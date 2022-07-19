import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pendonor_model.dart';
import '../pages/detail_pendonor.dart';

class PendonorTemplate extends StatelessWidget{
  final PendonorModel? pendonorModel;
  PendonorTemplate({this.pendonorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        // onTap: () {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => DetailPendonor()));
        // },
        title: Text(
          pendonorModel?.namaPendonor ?? "Tidak Ada Pendonor"
        ),
        subtitle: Text(pendonorModel?.emailPendonor ?? 'Pendonor Detail'),
      )
    );
  }
}

//GA  KEPAKE