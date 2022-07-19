import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/pages/detail_stok_rumah_sakit.dart';

class detailStok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:90.0, bottom: 10, left: 10, right: 10),
        child: Container(
          child: Column(
            children: <Widget> [
              Stack(
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
                                    child: AutoSizeText('00',
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
                                    child: AutoSizeText('00',
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
                                    child: AutoSizeText('00',
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
                                    child: AutoSizeText('00',
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
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      minimumSize: Size.fromHeight(100)
                  ),
                  child:
                  Text('Lihat Rumah Sakit', style: TextStyle(fontSize: 18),),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => stokRumahSakit())
                    );
                    //You can also make changes to your state here.
                  },),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 15),
              //   alignment: Alignment.center,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.redAccent,
              //         minimumSize: Size.fromHeight(100)
              //     ),
              //     child:
              //     Text('Lihat Daerah', style: TextStyle(fontSize: 18),),
              //     onPressed: () {
              //       Navigator.push(
              //           context, MaterialPageRoute(builder: (context) => stokDaerah())
              //       );
              //     },),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}