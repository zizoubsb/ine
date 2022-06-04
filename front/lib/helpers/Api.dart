import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://127.0.0.1:8000/api';
const Map<String, String> headers = {"Content-Type": "application/json"};

class Api {
  var token;

  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(_baseUrl + '/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(_baseUrl + '/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> register_client(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(_baseUrl + '/register_client');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login_client(
      String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(_baseUrl + '/login_client');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  postData(data, apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    //token = await SharedPreferencesManager().getAuthToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  postDataWithImage(data, apiUrl, filepath) async {
    var fullUrl = _baseUrl + apiUrl;
    //token = await SharedPreferencesManager().getAuthToken();
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl))
      ..fields.addAll(data)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    return await request.send();
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
  // _setFormHeaders() => {
  //       'Content-type': 'application/x-www-form-urlencoded',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     };

}

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
