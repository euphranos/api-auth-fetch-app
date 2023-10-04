import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_exercises/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map((e) => UserModel.fromMap(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());

final userDataProvider = FutureProvider<List<UserModel>>(
    (ref) => ref.watch(userProvider).getUsers());
