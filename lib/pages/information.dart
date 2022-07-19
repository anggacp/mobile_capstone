import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/pages/webview/webview_covid.dart';
import 'package:plasmahero/pages/webview/webview_edukasi.dart';
import 'package:plasmahero/pages/webview/webview_pemerintah.dart';
import 'package:plasmahero/pages/webview/webview_plasma.dart';

import 'donor_plasma.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget> [
              Container(
                margin: EdgeInsets.only(top: 80.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Informasi',
                            style: TextStyle(fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      )),
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
                        minimumSize: Size.fromHeight(50)
                    ),
                    child:
                    Text('COVID - 19 ', style: TextStyle(fontSize: 18),),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WebViewCovid())
                      );
                        //You can also make changes to your state here.
                    },),
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
                        minimumSize: Size.fromHeight(50)
                    ),
                    child:
                    Text('Plasma Konvalesen ', style: TextStyle(fontSize: 18),),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WebViewPlasma())
                      );
                      //You can also make changes to your state here.
                    },),
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
                        minimumSize: Size.fromHeight(50)
                    ),
                    child:
                    Text('Edukasi Pemerintah', style: TextStyle(fontSize: 18),),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WebViewEdukasi())
                      );
                      //You can also make changes to your state here.
                    },),
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
                        minimumSize: Size.fromHeight(50)
                    ),
                    child:
                    Text('Pendukung Pemerintah', style: TextStyle(fontSize: 18),),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WebViewPemerintah())
                      );
                      //You can also make changes to your state here.
                    },),
                ),
              ),
            ],
          ),
      ),
    );
  }
}