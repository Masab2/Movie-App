import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'appUrl.dart';
import 'package:movie_app/Model/MoviesModel.dart';

class ApiServices {
  Future<MoviesModel> fetchdata() async {
    final response = await http.get(Uri.parse(AppUrl.baseurl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return MoviesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
