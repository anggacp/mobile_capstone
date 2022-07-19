import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/pages/atur_stok_darah/atur_stok_darah_sardjito.dart';
import 'package:plasmahero/pages/display_pendonor.dart';

import '../../API/service.dart';

class UserMainSardjito extends StatefulWidget {
  final String? accesstoken;

  const UserMainSardjito({Key? key, this.accesstoken}) : super(key: key);

  @override
  State<UserMainSardjito> createState() => _UserMainSardjito();
}

class _UserMainSardjito extends State<UserMainSardjito> {
  @override
  void initState() {
    super.initState();
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
                    child: Text('Halo RS Sardjito',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
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
                    height: 270.0,
                    color: Color(0xffFFD460),
                  ),
                ),
                Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'API Distribusi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ))),
                Container(
                  margin: EdgeInsets.only(top: 70, left: 20),
                  child: Text('Jakarta : ',style: TextStyle(
                      fontSize: 18
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 20),
                  child: Text('Jawa Barat : ',style: TextStyle(
                      fontSize: 18
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 130, left: 20),
                  child: Text('Jawa Tengah : ',style: TextStyle(
                      fontSize: 18
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 160, left: 20),
                  child: Text('Yogyakarta : ',style: TextStyle(
                      fontSize: 18
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 190, left: 20),
                  child: Text('Jawa Timur : ',style: TextStyle(
                      fontSize: 18
                  )),
                ),
Center(
  child: Container(
    margin: EdgeInsets.only(top: 230),
    child: Text('Distribusi Per Tanggal 12 / 07 / 2022')
  ),
)
//                   Container(
//                     margin: EdgeInsets.only(top: 80, left: 10, right: 10),
//                     child: SizedBox(
//                       height: 150,
//                       child: Container(
//                         margin: EdgeInsets.only(top: 10),
//                         child: GridView.count(
//                           shrinkWrap: true,
// //childAspectRation: (width/height)
//                           childAspectRatio: (2 / 3),
//                           padding: const EdgeInsets.all(5),
//                           crossAxisSpacing: 8,
//                           mainAxisSpacing: 8,
//                           crossAxisCount: 4,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xffFFD460),
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Text('A', style: TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.bold)),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 3.0, left: 3.0, right: 3.0),
//                                     child: AutoSizeText(
//                                       stokA.toString(),
//                                       style: TextStyle(fontSize: 30),
//                                       maxLines: 1,),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xffFFD460),
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Text('B', style: TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.bold)),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 3.0, left: 3.0, right: 3.0),
//                                     child: AutoSizeText(
//                                       stokB.toString(),
//                                       style: TextStyle(fontSize: 30),
//                                       maxLines: 1,),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xffFFD460),
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Text('AB', style: TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.bold)),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 3.0, left: 3.0, right: 3.0),
//                                     child: AutoSizeText(
//                                         stokAB.toString(),
//                                       style: TextStyle(fontSize: 30),
//                                       maxLines: 1,),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xffFFD460),
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Text('O', style: TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.bold)),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 3.0, left: 3.0, right: 3.0),
//                                     child: AutoSizeText(
//                                       stokO.toString(),
//                                       style: TextStyle(fontSize: 30),
//                                       maxLines: 1,),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ),
//                     ),
//                   ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    minimumSize: Size.fromHeight(50)),
                child: Text(
                  'Atur Stok Darah',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AturStokDarahSardjito()));
                  //You can also make changes to your state here.
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    minimumSize: Size.fromHeight(50)),
                child: Text(
                  'Screening Calon Pendonor',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayPendonor()));
                  //You can also make changes to your state here.
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
