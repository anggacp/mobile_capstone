import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/pages/kurang_stok_plasma/kurang_stok_plasma_hasan.dart';
import 'package:plasmahero/pages/kurang_stok_plasma/kurang_stok_plasma_sardjito.dart';
import 'package:plasmahero/pages/tambah_stok_plasma/tambah_stok_plasma_hasan.dart';
import 'package:plasmahero/pages/tambah_stok_plasma/tambah_stok_plasma_sardjito.dart';

import '../../API/service.dart';

class AturStokDarahHasan extends StatefulWidget {
  final String? accesstoken;

  const AturStokDarahHasan({Key ? key, this.accesstoken}) : super(key: key);

  @override
  State<AturStokDarahHasan> createState() => _AturStokDarahHasan();
}

class _AturStokDarahHasan extends State<AturStokDarahHasan> {
  final _apiServices = ApiDonorPlasma();

  int? stokA;
  int? stokB;
  int? stokAB;
  int? stokO;

  getStokRs() async {
    _apiServices.getStokRumahSakitDetail3(context).then((resp) => setState(() {
      stokA = resp.stokPlasmaA;
      stokB = resp.stokPlasmaB;
      stokAB = resp.stokPlasmaAB;
      stokO = resp.stokPlasmaO;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Halo RS Hasan Sadikin',
                            style: TextStyle(fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 250.0,
                        color: Color(0xffEA5455),
                      ),
                    ),
                    Center(
                        child:
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child:
                            Text('Stok Plasma Konvalesen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),))),
                    Container(
                      margin: EdgeInsets.only(top: 80, left: 10, right: 10),
                      child: SizedBox(
                        height: 150,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: GridView.count(
                            shrinkWrap: true,
//childAspectRation: (width/height)
                            childAspectRatio: (2 / 3),
                            padding: const EdgeInsets.all(5),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 4,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFD460),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('A', style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 3.0, right: 3.0),
                                      child: AutoSizeText(stokA.toString(),
                                        style: TextStyle(fontSize: 30),
                                        maxLines: 1,),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFD460),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('B', style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 3.0, right: 3.0),
                                      child: AutoSizeText(stokB.toString(),
                                        style: TextStyle(fontSize: 30),
                                        maxLines: 1,),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFD460),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('AB', style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 3.0, right: 3.0),
                                      child: AutoSizeText(stokAB.toString(),
                                        style: TextStyle(fontSize: 30),
                                        maxLines: 1,),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFD460),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('O', style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 3.0, right: 3.0),
                                      child: AutoSizeText(stokO.toString(),
                                        style: TextStyle(fontSize: 30),
                                        maxLines: 1,),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: Colors.redAccent,
                        side: BorderSide(color: Colors.redAccent),
                        minimumSize: Size.fromHeight(50)
                    ),
                    child:
                    Text('Refresh', style: TextStyle(fontSize: 18),),
                    onPressed: () {
                      getStokRs();
                      //You can also make changes to your state here.
                    },),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 5),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            minimumSize: Size(160,160)
                        ),
                        child:
                        Text('-', style: TextStyle(fontSize: 50),),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => KurangStokHasan())
                          );
                        },),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 5),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            minimumSize: Size(160,160)
                        ),
                        child:
                        Text('+', style: TextStyle(fontSize: 50),),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => TambahStokHasan())
                          );
                        },),
                    ),
                  ],
                ),
              )

            ],
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    getStokRs();
  }
}