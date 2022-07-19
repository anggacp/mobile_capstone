import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/API/service.dart';
import 'package:plasmahero/pages/prediction/prediksi_covid_jakarta.dart';

import '../models/prediction_model.dart';

class PrediksiCovid extends StatelessWidget {
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
                      child: Text('Prediksi Covid',
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
                  Text('Jakarta', style: TextStyle(fontSize: 18),),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PrediksiCovidJakarta())
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
                  Text('Jawa Barat', style: TextStyle(fontSize: 18),),
                  onPressed: () {
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
                  Text('Jawa Tengah', style: TextStyle(fontSize: 18),),
                  onPressed: () {
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
                  Text('Jawa Timur', style: TextStyle(fontSize: 18),),
                  onPressed: () {
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
                  Text('Yogyakarta', style: TextStyle(fontSize: 18),),
                  onPressed: () {
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
