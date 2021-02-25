import 'dart:convert';
import 'package:covid/api/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetPositif {
  final String postUrl = "https://api.kawalcorona.com/positif";
  Future<List<Post>> getPost() async{
    Response res = await get(postUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "data tidak bisa di akses";
    }
  }
}
class DataGlobal {
  final String url = "https://api.kawalcorona.com/";
  Future<List<CovidGlobal>> getDataGlobal() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CovidGlobal> dataGlobal =
          body.map((dynamic item) => CovidGlobal.fromJson(item)).toList();
      return dataGlobal;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}
class DataIndo {
  final String url = "https://api.kawalcorona.com/indonesia/provinsi";
  Future<List<CovidProvinsi>> getDataIndo() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CovidProvinsi> dataIndo =
          body.map((dynamic item) => CovidProvinsi.fromJson(item)).toList();
      return dataIndo;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}

class DataIndonesia {
  final String url = "https://api.kawalcorona.com/indonesia";
  Future<List<Covid>> getDataIndonesia() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Covid> dataIndonesia =
          body.map((dynamic item) => Covid.fromJson(item)).toList();
      return dataIndonesia;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}