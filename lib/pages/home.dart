import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plasmahero/API/service.dart';
import 'package:plasmahero/pages/prediksi_covid.dart';

import '../API/covid_api.dart';
import '../API/covid_indonesia.dart';
import 'detail_stok_rumah_sakit.dart';
import 'donor_plasma.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final _apiServices = ApiDonorPlasma();

  int? stokA;
  int? stokB;
  int? stokAB;
  int? stokO;

  getStokTotal() async {
    _apiServices.getStokRumahSakitTotal(context).then((resp) => setState(() {
      stokA = resp.stokPlasmaA;
      stokB = resp.stokPlasmaB;
      stokAB = resp.stokPlasmaAB;
      stokO = resp.stokPlasmaO;

    }));
  }

  @override
  Widget build(BuildContext context) {
    final f = NumberFormat();

    return Scaffold(

      body:
      FutureBuilder<IndonesiaStat>(
          future: CovidAPI().getIndonesiaData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Periksa koneksi anda!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                ),
              );
            }
            else {
              return
                SingleChildScrollView(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0)),
                      child: Container(
                        height: 195.0,
                        color: Color(0xffEA5455),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 70.0),
                            child: Padding(
                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text('Plasma Konvalesen',
                                              style: TextStyle(fontSize: 35,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: GridView.count(
                                shrinkWrap: true,
                                //childAspectRation: (width/height)
                                childAspectRatio: (2 / 3),
                                padding: const EdgeInsets.all(5),
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
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
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 20,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => stokRumahSakit())
                                    );
                                  },
                                  child: Text('Detail Stok >', style: TextStyle(color: Colors.blue), textAlign: TextAlign.right,),
                                )
                              ),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    minimumSize: Size.fromHeight(50)
                                ),
                                child:
                                AutoSizeText('Daftar Donor Plasma Konvalesen', style: TextStyle(fontSize: 18), maxLines: 1,),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => DonorPlasma())
                                  );
                                  //You can also make changes to your state here.
                                },),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                    minimumSize: Size.fromHeight(50)
                                ),
                                child:
                                AutoSizeText('Lihat Prediksi Kasus Covid-19', style: TextStyle(fontSize: 18), maxLines: 1,),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => PrediksiCovid())
                                  );
                                },),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: AutoSizeText(
                                              'Data diupdate pada : ${snapshot.data!.latestUpdated} WIB',
                                              style: TextStyle(fontSize: 18), maxLines: 1,                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  side: BorderSide(color: Colors.redAccent),
                                  minimumSize: Size.fromHeight(50)
                                ),
                                child:
                                    Text('Perbarui Data', style: TextStyle(fontSize: 18),),
                                onPressed: () {
                                  setState(() {
                                    //You can also make changes to your state here.
                                  });
                                  },),
                      ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  color: Color(0xffFFD460),
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
                                            'Total Kasus',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25.0),
                                          child: Text(
                                            '${f.format(snapshot.data?.cases)}',
                                            style: TextStyle(
                                                fontSize: 50.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 90.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${f.format(
                                                    snapshot.data?.todayCases)}',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  color: Color(0xffFFD460),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 14.0, bottom: 18.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            padding:
                                            EdgeInsets.only(right: 20.0),
                                            child: Text(
                                              ' ',
                                              style: TextStyle(fontSize: 30.0),
                                            )),
                                        Container(
                                          child: Text(
                                            'Sembuh',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25.0),
                                          child: Text(
                                            '${f.format(
                                                snapshot.data?.recovered)}',
                                            style: TextStyle(
                                                fontSize: 50.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 90.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${f.format(snapshot.data
                                                    ?.todayRecovered)}',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                color: Color(0xffFFD460),
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
                                          'Meninggal',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          '${f.format(snapshot.data?.deaths)}',
                                          style: TextStyle(
                                              fontSize: 50.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 90.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${f.format(
                                                  snapshot.data?.todayDeaths)}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                    ),
              ]
                )
              );
            }
          }),
    );
  }

  @override
  void initState() {

    super.initState();
    getStokTotal();
  }
}