import 'package:flutter/material.dart';
import 'package:riverpod_exercises/services/auth_services.dart';
import 'package:riverpod_exercises/utils/snackbar.dart';

void loginUser(String email, String password, BuildContext context,
    AuthServices userLoginProvider) async {
  if (email.isEmpty || password.isEmpty) {
    showSnackBar(context, "Please fill the fields");
    return;
  }
  String result = await userLoginProvider.loginUser(email, password);
  if (result == "Login Success") {
    Navigator.pushNamed(context, "/Home");
  } else {
    showSnackBar(context, result);
  }
}

void logOutUser(BuildContext context, AuthServices userLoginProvider) {
  userLoginProvider.logOut();
  Navigator.pushNamed(context, "/Login");
}
