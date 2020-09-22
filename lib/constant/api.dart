// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static final String apiUrl =
      "https://whispering-garden-19030.herokuapp.com/products/allproducts";

  static Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
  }
}
