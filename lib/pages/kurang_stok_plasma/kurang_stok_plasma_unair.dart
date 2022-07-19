import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../API/service.dart';
import '../../models/stokRhesus_model.dart';
import '../../models/stok_model.dart';

List<StokRhesusModel> _stokRhesusList = StokRhesusData().rhesus;
String? _stokRhesus;
List<StokModel> _stokList = StokData().stok;
String? _stok;

class KurangStokUnair extends StatefulWidget {
  @override
  _KurangStokUnair createState() => _KurangStokUnair();
}

class _KurangStokUnair extends State<KurangStokUnair> {
  final _apiService = ApiDonorPlasma();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: formGlobalKey,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(child: Text('Golongan Darah')),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                      ),
                      isExpanded: true,
                      value: _stok,
                      hint: Text(
                        'Pilih Golongan Darah',
                      ),
                      onChanged: (v) {
                        setState(() {
                          _stok = v.toString();
                        });
                      },
                      validator: (value) =>
                      value == null ? 'Tidak boleh kosong' : null,
                      items: _stokList.map((item) {
                        return DropdownMenuItem(
                          child: Text("${item.key.toString()}"),
                          value: item.value,
                        );
                      }).toList(),
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
                      value: _stokRhesus,
                      hint: Text(
                        'Pilih Rhesus',
                      ),
                      onChanged: (v) {
                        setState(() {
                          _stokRhesus = v.toString();
                        });
                      },
                      validator: (value) =>
                      value == null ? 'Tidak boleh kosong' : null,
                      items: _stokRhesusList.map((item) {
                        return DropdownMenuItem(
                          child: Text("${item.key.toString()}"),
                          value: item.value,
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              minimumSize: Size.fromHeight(50)),
                          child: Text(
                            'Kurang Stok',
                            style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (!formGlobalKey.currentState!
                                .validate()) {
                              final snackBar = SnackBar(
                                content: Text(
                                    "Pilih Data yang ingin ditambah"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if (formGlobalKey.currentState!
                                .validate()) {
                              String? kategori = _stok! + _stokRhesus!;
                              _apiService.MinusStok5(context, kategori.toString());
                            }
                          })),
                ],
              ),
            ),
          )),
    );
  }
}
