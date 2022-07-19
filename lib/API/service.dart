import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plasmahero/models/prediction_model.dart';
import 'package:plasmahero/models/stokRumahSakit_model.dart';
import 'package:plasmahero/models/user_model.dart';
import 'package:plasmahero/pages/prediksi_covid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pendonor_model.dart';

class ApiDonorPlasma {
  String baseUrl = "https://capstone-pk.herokuapp.com";

  Future<dynamic> CreatePendonor(
      context,
      String nama,
      String email,
      String alamat,
      String kota,
      String usia,
      String jenisKelamin,
      String berat,
      String golonganDarah,
      String rhesusDarah,
      String tanggalNegatif,
      String transfusi,
      String sudahVaksin,
      String namaVaksin,
      String dosis,
      String penyakit) async {

    Map data = {
      "namaPendonor": nama,
      "emailPendonor": email,
      "alamatPendonor": alamat,
      "kotaPendonor": kota,
      "usiaPendonor": usia,
      "jenisKelaminPendonor": jenisKelamin,
      "beratBadanPendonor": berat,
      "golonganDarahPendonor": golonganDarah,
      "rhesusDarahPendonor": rhesusDarah,
      "tanggalNegatifPendonor": tanggalNegatif,
      "mendapatkanTransfusiPendonor": transfusi,
      "sudahDivaksinPendonor": sudahVaksin,
      "namaVaksinPendonor": namaVaksin,
      "dosisVaksinPendonor": dosis,
      "penyakitBeratPendonor": penyakit
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/calonPendonor/createCalonPendonor',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 201) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengupload Data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Error.."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }

  Future getPendonorData() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/calonPendonor/getCalonPendonor'));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List pendonor = it.map((e) => PendonorModel.fromJson(e)).toList();
        return pendonor;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<StokRumahSakitModel> getStokRumahSakitTotal(context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/total/allrs"));
      // headers: <String, String>{'Authorization': "Bearer $token"});

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }

  Future<StokRumahSakitModel> getStokRumahSakitDetail(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/$id"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }


  Future<StokRumahSakitModel> getStokRumahSakitUser(
      context, String id) async {
    var accessToken = await login;
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/"));
      // headers: <String, String>{'Authorization': "Bearer $accessToken"});

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }

  Future<dynamic> login(context, String username, String password) async {
    Map data = {'username': username, 'password': password};
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/user/login',
      headers: {"Content-type": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Login"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Error.."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.statusCode}");
    return response;
  }

  Future<UserRsModel?> signIn(String username, String password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final formBody = FormData.fromMap({
      "username": username,
      "password": password,
    });

    try {
      Response response = await Dio().post('$baseUrl/user/login', data: formBody);
      print("Data Login -> ${response.data}");

      if (response.statusCode == 200) {
        if (response.data['status'] == 400 || response.data['error'] == true) {
          print("Error username or password");

          return null;
        }
        prefs.setString("token", response.data["accessToken"]);
        return UserRsModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in Sign In -> $e");
    }
  }

  //GetStokRumahSakit
  Future<StokRumahSakitModel> getStokRumahSakitDetail1(
      context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/1"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokRumahSakitDetail2(
      context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/2"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokRumahSakitDetail3(
      context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/3"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokRumahSakitDetail4(
      context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/4"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokRumahSakitDetail5(
      context) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/5"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }

  //GetDetailStok

  Future<StokRumahSakitModel> getStokDetail1(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/detail/1"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokDetail2(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data//detail/2"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokDetail3(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/detail/3"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokDetail4(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/detail/4"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
  Future<StokRumahSakitModel> getStokDetail5(
      context, String id) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("$baseUrl/data/detail/5"));

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new StokRumahSakitModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${resbody["message"]}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }


  //TambahStok
  Future<dynamic> AddStok1(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/tambah/1',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Menambah Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Terjadi Kesalahan, silahkan ulang"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> AddStok2(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/tambah/2',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Menambah Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Terjadi Kesalahan, silahkan ulang"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> AddStok3(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/tambah/3',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Menambah Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Terjadi Kesalahan, silahkan ulang"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> AddStok4(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/tambah/4',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Menambah Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Terjadi Kesalahan, silahkan ulang"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> AddStok5(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/tambah/5',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Menambah Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Terjadi Kesalahan, silahkan ulang"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }


  //KurangStok
  Future<dynamic> MinusStok1(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/kurang/1',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengurangi Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Stok yang ingin dikurangi tidak mencukupi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> MinusStok2(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/kurang/2',
      headers: {"Content-type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengurangi Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Stok yang ingin dikurangi tidak mencukupi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> MinusStok3(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/kurang/3',
      headers: {"Content-type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengurangi Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Stok yang ingin dikurangi tidak mencukupi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> MinusStok4(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/kurang/4',
      headers: {"Content-type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengurangi Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Stok yang ingin dikurangi tidak mencukupi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future<dynamic> MinusStok5(
      context,
      String kategori) async {

    Map data = {
      "kategori": kategori
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/data/kurang/5',
      headers: {"Content-type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Sukses Mengurangi Data Stok, silahkan refresh data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("Stok yang ingin dikurangi tidak mencukupi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
//delete
  Future<dynamic> deleteCalonPendonor(
      context,
      String id) async {

    Map data = {
      "_id": id
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/calonPendonor/delete',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Data terkonfirmasi, silahkan refresh"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("error"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }

  //send email
  Future<dynamic> sendEmailDiterima(
      context,
      String email) async {

    Map data = {
      "email": email
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/calonPendonor/mailLolos',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Email Terkirim, silahkan refresh"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("error"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }


  Future<dynamic> sendEmailDitolak(
      context,
      String email) async {

    Map data = {
      "email": email
    };
    var body = json.encode(data);
    var response = await http.post(
      '$baseUrl/calonPendonor/mailGagal',
      headers: {"Content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        content: Text("Email Terkirim, silahkan refresh"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
      // Navigator.pop(context);
      return response;
    } else {
      final snackBar = SnackBar(
        content: Text("error"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop(true);
    }

    print("${response.body}");
    return response;
  }
  Future getPrediksiJakarta() async  {
  // Future<PredictionModel> getPrediksiJakarta(String date) async {
    var client = http.Client();

    try {
      var res = await client.get(Uri.parse("http://139.59.126.252/predict/arima/jakarta?date=2022-06-20"));
      // headers: <String, String>{'Authorization': "Bearer $token"});

      var resbody = jsonDecode(res.body);

      if (res != null) {
        if (res.statusCode == 200) {
          if (resbody["error"] == true && resbody["status"] == 404) {}

          if (res.statusCode == 200) {
            return new PredictionModel.fromJson(resbody);
          } else {
            if (res.statusCode == 404 || res.statusCode == 145) {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            } else {
              throw Exception(
                  'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
            }
          }
        } else {
          throw Exception("SERVER ERROR");
        }
      } else {
        throw Exception(
            'Failed to load Data!\nStatus : ${res.statusCode} Message : ${res.reasonPhrase}');
      }
    } finally {
      client.close();
    }
  }
}
