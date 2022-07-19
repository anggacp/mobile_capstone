import 'package:flutter/material.dart';
import 'package:plasmahero/models/rumahSakit_model.dart';
import '../API/service.dart';

class stokRumahSakit extends StatefulWidget {
  const stokRumahSakit ({Key ? key}) : super(key: key);

@override
State<stokRumahSakit> createState() => _stokRumahSakit();
}

class _stokRumahSakit extends State<stokRumahSakit> {
  List<RumahSakitModel> _rumahSakitList = RumahSakitData().rumahSakit;
  String? _rumahSakit;
  String? isReady;

  void pilihRumahSakit(String value){
    setState(() {
    });
  }

  final _apiServices = ApiDonorPlasma();

  int? totalStok;
  int? stokA;
  int? stokB;
  int? stokAB;
  int? stokO;

  getStokDetail(String id) async {
    _apiServices.getStokRumahSakitDetail(context, id).then((resp) => setState(() {
      totalStok = resp.totalPlasma;
      stokA = resp.stokPlasmaA;
      stokB = resp.stokPlasmaB;
      stokAB = resp.stokPlasmaAB;
      stokO = resp.stokPlasmaO;
      if (totalStok!= null) {
        isReady = "true";
      }

    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                    ),
                    isExpanded: true,
                    value: _rumahSakit,
                    hint: Text(
                      'Daftar Rumah Sakit',
                    ),
                    onChanged: (v) {
                      setState(() {
                        _rumahSakit = v.toString();
                        getStokDetail(_rumahSakit!);
                      });
                    },
                    validator: (value) => value == null
                        ? 'Tidak boleh kosong'
                        : null,
                    items: _rumahSakitList.map((item) {
                      return DropdownMenuItem(
                        child:
                        Text("${item.key.toString()}"),
                        value: item.value,
                      );
                    }).toList(),
                  ),
                ),
                isReady == "true"
                ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          height: 150,
                          color: Color(0xffEA5455),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0, left: 14.0, bottom: 18.0),
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      ' ',
                                      style: TextStyle(fontSize: 30.0),
                                    )),
                                Container(
                                  child: Text(
                                    'Total Plasma',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Text(
                                    totalStok.toString(),
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          height: 100,
                          color: Color(0xff2D2926),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 14.0),
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(fontSize: 30.0),
                                    )),
                                Container(
                                  child: Text(
                                    'Golongan A',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    stokA.toString(),
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          height: 100,
                          color: Color(0xff2D2926),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 14.0),
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      ' ',
                                      style: TextStyle(fontSize: 30.0),
                                    )),
                                Container(
                                  child: Text(
                                    'Golongan B',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    stokB.toString(),
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          height: 100,
                          color: Color(0xff2D2926),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 14.0),
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      ' ',
                                      style: TextStyle(fontSize: 30.0),
                                    )),
                                Container(
                                  child: Text(
                                    'Golongan AB',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    stokAB.toString(),
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          height: 100,
                          color: Color(0xff2D2926),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 14.0),
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      ' ',
                                      style: TextStyle(fontSize: 30.0),
                                    )),
                                Container(
                                  child: Text(
                                    'Golongan O',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    stokO.toString(),
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Container(

                )
              ],
            ),
          ),
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}