import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/API/service.dart';
import 'package:plasmahero/pages/user_main/user_main_sardjito.dart';

import '../models/pendonor_model.dart';

class DetailPendonor extends StatefulWidget {
  final String? id,
      namaPendonor,
      emailPendonor,
      alamatPendonor,
      kotaPendonor,
      usiaPendonor,
      jenisKelaminPendonor,
      beratBadanPendonor,
      golonganDarahPendonor,
      rhesusDarahPendonor,
      tanggalNegatifPendonor,
      mendapatkanTransfusiPendonor,
      sudahDivaksinPendonor,
      namaVaksinPendonor,
      dosisVaksinPendonor,
      penyakitBeratPendonor;
  final PendonorModel? pendonorModel;

  const DetailPendonor(
      {Key? key,
      this.id,
      this.namaPendonor,
      this.emailPendonor,
      this.alamatPendonor,
      this.kotaPendonor,
      this.usiaPendonor,
      this.jenisKelaminPendonor,
      this.beratBadanPendonor,
      this.golonganDarahPendonor,
      this.rhesusDarahPendonor,
      this.tanggalNegatifPendonor,
      this.mendapatkanTransfusiPendonor,
      this.sudahDivaksinPendonor,
      this.namaVaksinPendonor,
      this.dosisVaksinPendonor,
      this.penyakitBeratPendonor,
      this.pendonorModel})
      : super(key: key);

  @override
  State<DetailPendonor> createState() => _DetailPendonorState(pendonorModel);
}

class _DetailPendonorState extends State<DetailPendonor> {
  final _apiService = new ApiDonorPlasma();
  final PendonorModel? pendonorModel;

  _DetailPendonorState(this.pendonorModel);

  @override
  void initState() {
    super.initState();
    // howToRun();
    // imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Data Diri',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Nama Lengkap',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.namaPendonor ?? "Tidak Ada Pendonor",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.emailPendonor ?? "Tidak Ada Email",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Alamat Lengkap',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.alamatPendonor ?? "Tidak Ada Alamat",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Kota',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.kotaPendonor ?? "Tidak Ada Kota",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Jenis Kelamin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.jenisKelaminPendonor ?? "Tidak Ada Jenis Kelamin",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Usia',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.usiaPendonor ?? "Tidak Ada Usia",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Berat Badan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.beratBadanPendonor ?? "Tidak Ada Berat Pendonor",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Terkait COVID-19',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Golongan Darah',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.golonganDarahPendonor ?? "Tidak Ada Golongan Darah",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Rhesus Darah',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.rhesusDarahPendonor ?? "Tidak Ada Rhesus Darah",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Tanggal Saat SWAB Negatif',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.tanggalNegatifPendonor ?? "Tidak Ada Tanggal",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Pada Saat (+) Apakah Mendapatkan Transfusi?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.mendapatkanTransfusiPendonor ??
                        "Tidak Ada Transfusi",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Apakah Sudah Divaksin?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                widget.sudahDivaksinPendonor ?? "Tidak Ada Status Vaksin",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            )
          ])),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Nama Vaksin yang Didapat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.namaVaksinPendonor ?? "-",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Dosis yang Didapat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget.dosisVaksinPendonor ?? "-",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Apakah Punya Penyakit Berat / Bawaan ?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      widget.penyakitBeratPendonor ?? "-",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: Size.fromHeight(40)),
                    child: Text('Terima'),
                    onPressed: () async {
                      await _apiService.sendEmailDiterima(
                          context, widget.emailPendonor.toString());
                      await _apiService.deleteCalonPendonor(
                          context, widget.id.toString());
                    }),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, minimumSize: Size.fromHeight(40)),
                    child: Text('Tolak'),
                    onPressed: () async {
                      await _apiService.sendEmailDitolak(
                          context, widget.emailPendonor.toString());
                      await _apiService.deleteCalonPendonor(
                          context, widget.id.toString());
                    })
              ],
            ),
          ),
        ]),
      ))),
    );
  }
}
