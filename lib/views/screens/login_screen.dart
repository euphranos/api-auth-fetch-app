import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_exercises/controllers/auth_controller.dart';
import 'package:riverpod_exercises/services/auth_services.dart';

import 'package:riverpod_exercises/views/widgets/custom_button.dart';
import 'package:riverpod_exercises/views/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLoginProvider = ref.watch(authProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints(maxWidth: 800, minWidth: 300),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/login.svg",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                  textEditingController: _emailController,
                  hintText: "Enter email",
                  iconData: Icons.email),
              CustomTextField(
                  textEditingController: _passwordController,
                  hintText: "Enter pasword",
                  iconData: Icons.lock,
                  isObscure: true),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  loginUser(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      context,
                      userLoginProvider);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
