import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plasmahero/API/login_service.dart';
import 'package:plasmahero/models/login_view_model.dart';
import 'package:plasmahero/models/user_model.dart';
import 'package:plasmahero/pages/user_main/user_main_gatot.dart';
import 'package:plasmahero/pages/user_main/user_main_hasan.dart';
import 'package:plasmahero/pages/user_main/user_main_pmi.dart';
import 'package:plasmahero/pages/user_main/user_main_sardjito.dart';
import 'package:plasmahero/pages/user_main/user_main_unair.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../API/service.dart';

class Login extends StatefulWidget {
  const Login ({Key ? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  final _apiService = LoginService();
  final formGlobalKey = GlobalKey<FormState>();

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Container(
          margin: EdgeInsets.only(top: 200),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget> [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 290.0,
                        color: Color(0xff2D2926),
                      ),
                    ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: <Widget> [
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Icon(Icons.person, color: Colors.white, size: 40,)),
                                  new Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10, right: 10),
                                          height: 50,
                                          child: TextFormField(
                                            controller: usernameCtrl,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: 'Username',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              return (value == null || value.isEmpty)
                                                  ? 'Username Tidak Boleh Kosong'
                                                  : null;
                                            },
                                          ))
                                  )
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                  children: <Widget> [
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(Icons.key, color: Colors.white, size: 40,)),
                                    new Flexible(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10, right: 10),
                                            height: 50,
                                            child: TextFormField(
                                              controller: passwordCtrl,
                                              keyboardType: TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: 'Password',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                return (value == null || value.isEmpty)
                                                    ? 'Password Tidak Boleh Kosong'
                                                    : null;
                                              },
                                            ))
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  minimumSize: Size.fromHeight(50)
                              ),
                              child:
                              Text('Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              onPressed: () {
                                if (usernameCtrl.text == "sardjito" && passwordCtrl.text == "sardjito1") {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => UserMainSardjito())
                                  );
                                } else if (usernameCtrl.text != "sardjito" && passwordCtrl.text == "sardjito1") {
                                  final text = 'Data yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));
                                } else if (usernameCtrl.text == "sardjito" && passwordCtrl.text != "sardjito1") {
                                  final text = 'Password yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else if (usernameCtrl.text == "gatotsoebroto" && passwordCtrl.text == "gatotsoebroto1") {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => UserMainGatot())
                                  );
                                }else if (usernameCtrl.text == "gatotsoebroto" && passwordCtrl.text != "gatotsoebroto1") {
                                  final text = 'Password yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }if (usernameCtrl.text == "hasansadikin" && passwordCtrl.text == "hasansadikin1") {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => UserMainHasan())
                                  );
                                }else if (usernameCtrl.text == "hasansadikin" && passwordCtrl.text != "hasansadikin1") {
                                  final text = 'Password yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }if (usernameCtrl.text == "uddpmismrg" && passwordCtrl.text == "uddpmismrg1") {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => UserMainPmi())
                                  );
                                }else if (usernameCtrl.text == "uddpmismrg" && passwordCtrl.text != "uddpmismrg1") {
                                  final text = 'Password yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }if (usernameCtrl.text == "unairsurabaya" && passwordCtrl.text == "unairsurabaya1") {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => UserMainUnair())
                                  );
                                }else if (usernameCtrl.text == "unairsurabaya" && passwordCtrl.text != "unairsurabaya1") {
                                  final text = 'Password yang anda masukan salah!';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else if(usernameCtrl.text.isEmpty && passwordCtrl.text.isEmpty) {
                                  final text = 'Tolong masukkan data';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else if(passwordCtrl.text.isEmpty) {
                                  final text = 'Tolong masukkan password';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else if(usernameCtrl.text.isEmpty) {
                                  final text = 'Tolong masukkan data';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else {
                                  final text = 'Mohon Tunggu Sebentar';
                                  final snackBar = SnackBar(content: Text(text));

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                // if (formGlobalKey.currentState?.validate() ?? false) {
                                //   _apiService.login(usernameCtrl.text, passwordCtrl.text, context);
                                // }
                                // _viewModel.loginUser(
                                //     usernameCtrl.text, passwordCtrl.text);
                              }
                            //   _apiService.login(context, usernameCtrl.text, passwordCtrl.text)
                            // _apiService.fetchAlbum()
                            )
                          ),
                        )
                          ],
                        )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}