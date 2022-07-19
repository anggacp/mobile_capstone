import 'dart:convert';

import 'package:get/get.dart';
import 'package:plasmahero/controller/add_pendonor_controller.dart';

import '../models/pendonor_model.dart';
import 'package:http/http.dart' as http;

class DisplayCtrl extends GetxController{

  List<PendonorModel> displayPendonorList = [];
  // final addPendonorCtrl = Get.put<AddPendonorCtrl>(AddPendonorCtrl());

  bool isLoading = false;
  getPendonorFromDb() {
    isLoading = true;
    update();
    gettingTaskFromDb().then((_){
      isLoading = false;
      update();
    });
  }

  Future gettingTaskFromDb() async {
    var url = "https://capstone-pk.herokuapp.com/calonPendonor/getCalonPendonor";
    var response = await http.get(url);
    if(response.statusCode == 200){
      //everything ok
      print('response.status : 200');
      print('response.body : ${response.body}');

      var pendonorJson = json.decode(response.body);
      for(var json in pendonorJson){
        PendonorModel pendonor = PendonorModel.fromJson(json);
        displayPendonorList.add(pendonor);
      }
    } else {
      print('something wrong');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPendonorFromDb();
  }

}