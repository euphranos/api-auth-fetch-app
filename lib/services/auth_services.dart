import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String endpointLogin = "https://reqres.in/api/login";

  Future<String> loginUser(String email, String password) async {
    Map<String, String>? body = {"email": email, "password": password};
    Response response = await post(Uri.parse(endpointLogin), body: body);
    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      return "Login Success";
    } else {
      return "Error Code ${response.statusCode}";
    }
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await prefs.clear();
  }
}

final authProvider = Provider<AuthServices>((ref) => AuthServices());

final getTokenProvider = FutureProvider<String?>((ref) async {
  // Shared Preferences'ten token'i al
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  if (token == null) {
    return token;
  }
  return token;
});
