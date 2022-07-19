import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:plasmahero/models/LoginRequestModel.dart';
import 'package:plasmahero/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/user_main/user_main_sardjito.dart';

class LoginService {
  var url = Dio();
  final String loginUrl = 'https://capstone-pk.herokuapp.com/user/login';


  TextEditingController? usernameCtrl = TextEditingController();
  TextEditingController? emailPendonorCtrl = TextEditingController();


  // Future<UserRsModel?> login(String username, String password, context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   try {
  //     var response = await url.post(loginUrl, data: {"username" : username, "password": password});
  //     print("Data Login -> ${response}");
  //
  //     if (response.statusCode == 200) {
  //       if (response.statusCode == 401 || response.data['isSuccessful'] == false) {
  //         print("Error email or psw");
  //         Get.snackbar(
  //             "Username Tidak Ditemukan", "Error Username or Password");
  //         return null;
  //       }
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => UserMain()));
  //       prefs.setString("acessToken", response.data["data"]["accessToken"]);
  //       return UserRsModel.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     print("Error in Sign In -> $e");
  //   }
  // }
}
