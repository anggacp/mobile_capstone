import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/API/service.dart';

import '../../models/prediction_model.dart';

class PrediksiCovidJakarta extends StatefulWidget {
  const PrediksiCovidJakarta({Key? key}) : super(key: key);

  @override
  State<PrediksiCovidJakarta> createState() => _PrediksiCovidJakarta();
}

class _PrediksiCovidJakarta extends State<PrediksiCovidJakarta> {
  late int kasus;
  late String tanggal;
  late PredictionModel listPrediksi;
  ApiDonorPlasma apiDonorPlasma = ApiDonorPlasma();

  DateTime today = new DateTime.now();
  late String dateSlug =
      "${today.year.toString()}-${today.month.toString().padLeft(
      2, '0')}-${today.day.toString().padLeft(2, '0')}";

  getPendonorData() async {
    // listPrediksi = await apiDonorPlasma.getPrediksiJakarta(dateSlug);
    listPrediksi = await apiDonorPlasma.getPrediksiJakarta();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPendonorData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Jakarta',
                    style: TextStyle(fontSize: 35,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // PredictionModel pendonorModel = listPrediksi.;
                          return ListTile(
                            title: Text('Kasus : ' +
                                listPrediksi.predictions[index].kasus
                                    .toString()),
                            subtitle: Text('Tanggal : ' +
                                listPrediksi.predictions[index].tanggal
                                    .toString()),
                          );
                        },
                        // separatorBuilder: (context, index) {
                        //   return Divider();
                        // },
                        itemCount: listPrediksi.predictions.length),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}