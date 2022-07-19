import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserData {
  save(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userData", json.encode(value));
  }


  readx() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString("userData").toString());
  }

  read() async {
    //final prefs = await SharedPreferences.getInstance();

    try {
      UserRsModel user = UserRsModel.fromJson(await readx());
      if (user.data?.accessToken != null) {
        return user.data?.accessToken;
      }
      if (user.data?.accessToken == null) {
        return null;
      }
    } catch (Exception) {}

    // final prefs = await SharedPreferences.getInstance();
    // return json.decode(prefs.getString("userData").toString());
  }
}