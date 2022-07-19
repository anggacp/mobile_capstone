import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/API/service.dart';

import '../models/dosis_model.dart';
import '../models/goldar_model.dart';
import '../models/kelamin_model.dart';
import '../models/kota_model.dart';
import '../models/rhesus_model.dart';
import '../models/transfusi_model.dart';

List<KotaModel> _kotaList = KotaData().kota;
List<RhesusModel> _rhesusList = RhesusData().rhesus;
List<KelaminModel> _jenisKelaminList = KelaminData().kelamin;
List<GoldarModel> _goldarList = GoldarData().goldar;
List<TransfusiModel> _transfusiList = TransfusiData().transfusi;
List<DosisModel> _dosisList = DosisData().dosis;
String? _kota;
String? _rhesus;
String? _jenisKelamin;
String? _golonganDarah;
String? _transfusi;
String? _sudahVaksin;
String? _dosis;

class DonorPlasma extends StatefulWidget {
  @override
  _DonorPlasma createState() => _DonorPlasma();
}

class _DonorPlasma extends State<DonorPlasma> {
  final _apiService = ApiDonorPlasma();
  final formGlobalKey = GlobalKey<FormState>();

  final namaPendonorCtrl = TextEditingController();
  final emailPendonorCtrl = TextEditingController();
  final alamatPendonorCtrl = TextEditingController();
  final usiaPendonorCtrl = TextEditingController();
  final beratBadanPendonorCtrl = TextEditingController();
  final tanggalNegatifCtrl = TextEditingController();
  final namaVaksinPendonorCtrl = TextEditingController();
  final penyakitBeratPendonorCtrl = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        // GetBuilder<AddPendonorCtrl>(
        //     builder: (_) => addPendonorCtrl.isUploading
        //         ? Center(
        //             child: CircularProgressIndicator(),
        //           )
                 SingleChildScrollView(
                    child: Form(
                        key: formGlobalKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 70),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Pendaftaran Donor',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Plasma Konvalesen',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Data Diri',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 50,
                                        child: TextFormField(
                                          controller: namaPendonorCtrl,
                                          validator: (value) {
                                          return (value == null || value.isEmpty)
                                              ? 'Tidak Boleh Kosong'
                                              : null;
                                        },
                                        ))
                                    // DonorNameTextField()),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 50,
                                        child: TextFormField(
                                          controller: emailPendonorCtrl,
                                          validator: (value) {
                                            return (value == null || value.isEmpty)
                                                ? 'Tidak Boleh Kosong'
                                                : null;
                                          },
                                        ))
                                    // DonorEmailTextField()),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 50,
                                        child: TextFormField(
                                          controller: alamatPendonorCtrl,
                                          validator: (value) {
                                            return (value == null || value.isEmpty)
                                                ? 'Tidak Boleh Kosong'
                                                : null;
                                          },
                                        ))
                                    // )DonorAlamatTextField()),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _kota,
                                        hint: Text(
                                          'Daftar Kota',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _kota = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _kotaList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _jenisKelamin,
                                        hint: Text(
                                          'Jenis Kelamin',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _jenisKelamin = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _jenisKelaminList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 50,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: usiaPendonorCtrl,
                                          validator: (value) {
                                            return (value == null || value.isEmpty)
                                                ? 'Tidak Boleh Kosong'
                                                : null;
                                          },
                                        ))
                                    // DonorUsiaTextField()),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 50,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: beratBadanPendonorCtrl,
                                          validator: (value) {
                                            return (value == null || value.isEmpty)
                                                ? 'Tidak Boleh Kosong'
                                                : null;
                                          },
                                        ))
                                    // DonorBeratBadanTextField()),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Terkait COVID-19',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _golonganDarah,
                                        hint: Text(
                                          'Golongan Darah',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _golonganDarah = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _goldarList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _rhesus,
                                        hint: Text(
                                          'Rhesus Darah',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _rhesus = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _rhesusList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
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
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        height: 50,
                                        child: GestureDetector(
                                          onTap: () => _selectDate(context),
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              // onSaved: (val) {
                                              //   DateTime date = selectedDate;
                                              // },
                                              controller: tanggalNegatifCtrl,
                                              decoration: InputDecoration(
                                                labelText: "Date",
                                                icon: Icon(Icons.calendar_today),
                                              ),
                                              validator: (value) {
                                                return (value == null || value.isEmpty)
                                                    ? 'Tidak Boleh Kosong'
                                                    : null;
                                              },
                                            ),
                                          ),
                                        ),
                                    )
                                    // DonorTanggalSWABNegatifTextField()),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Pada Saat (+) Apakah Mendapatkan Transfusi?',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _transfusi,
                                        hint: Text(
                                          'Mendapat Transfusi?',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _transfusi = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _transfusiList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
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
                                        'Apakah Sudah Divaksin?',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                        ),
                                        isExpanded: true,
                                        value: _sudahVaksin,
                                        hint: Text(
                                          'Sudah Vaksin?',
                                        ),
                                        onChanged: (v) {
                                          setState(() {
                                            _sudahVaksin = v.toString();
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Tidak boleh kosong'
                                            : null,
                                        items: _transfusiList.map((item) {
                                          return DropdownMenuItem(
                                            child:
                                                Text("${item.key.toString()}"),
                                            value: item.value,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Nama Vaksin yang Didapat',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Lewati jika belum vaksin',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 50,
                                              child: TextFormField(
                                                controller:
                                                    namaVaksinPendonorCtrl,
                                              ))
                                          // DonorNamaVaksinTextField()),
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
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Lewati jika belum vaksin',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            child:
                                                DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                fillColor: Colors.white,
                                              ),
                                              isExpanded: true,
                                              value: _dosis,
                                              hint: Text(
                                                'Dosis yang Didapat',
                                              ),
                                              onChanged: (v) {
                                                setState(() {
                                                  _dosis = v.toString();
                                                });
                                              },
                                              items: _dosisList.map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(
                                                      "${item.key.toString()}"),
                                                  value: item.value,
                                                );
                                              }).toList(),
                                            ),
                                          ),
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
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Lewati jika tidak memiliki penyakit',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 50,
                                              child: TextFormField(
                                                controller:
                                                    penyakitBeratPendonorCtrl,
                                              ))
                                          // DonorPenyakitTextField()),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.redAccent,
                                            minimumSize: Size.fromHeight(50)),
                                        child: Text(
                                          'Daftar',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          if (!formGlobalKey.currentState!
                                              .validate()) {
                                            final snackBar = SnackBar(
                                              content: Text(
                                                  "Form belum terisi lengkap. Silahkan cek form yang belum terisi."),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                          if (formGlobalKey.currentState!
                                              .validate()) {
                                            _apiService.CreatePendonor(
                                                context,
                                                namaPendonorCtrl.text
                                                    .toString(),
                                                emailPendonorCtrl.text
                                                    .toString(),
                                                alamatPendonorCtrl.text
                                                    .toString(),
                                                _kota.toString(),
                                                usiaPendonorCtrl.text
                                                    .toString(),
                                                _jenisKelamin.toString(),
                                                beratBadanPendonorCtrl.text
                                                    .toString(),
                                                _golonganDarah.toString(),
                                                _rhesus.toString(),
                                                tanggalNegatifCtrl.text
                                                    .toString(),
                                                _transfusi.toString(),
                                                _sudahVaksin.toString(),
                                                namaVaksinPendonorCtrl.text
                                                    .toString(),
                                                _dosis.toString(),
                                                penyakitBeratPendonorCtrl.text
                                                    .toString());
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))));
  }

// List<PendonorModel> pendonorModel = List();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        tanggalNegatifCtrl.text = date;
      });
  }
}

