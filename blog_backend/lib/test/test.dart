import 'dart:convert';

import 'package:http/http.dart';

void main() async {
  login();
}

void login() {
  post(Uri.parse('http://0.0.0.0:8080/api/v1/user/login'),
      body: jsonEncode({
        "username": "admin",
        "password": "123456",
      })).then((result) {
    print(result.body);
  });
}

void userInfo() {
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwicGFzc3dvcmQiOiIxMjM0NTYiLCJpYXQiOjE3MjQyMzIwNTMsImV4cCI6MTcyNjgyNDA1M30.L_0nLK24X5q78rMs0ZzgeIv0UrK0Gft-YRtDBgSc0Kg";

  post(Uri.parse('http://0.0.0.0:8080/api/v1/user/info'),
      body: jsonEncode({
        "token": token,
      })).then((result) {
    print(result.body);
  });
}
