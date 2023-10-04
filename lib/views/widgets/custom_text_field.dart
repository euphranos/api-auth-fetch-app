// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData iconData;
  bool? isObscure;
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.iconData,
    this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
          )),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(iconData, color: Colors.orange),
          hintText: hintText,
        ),
      ),
    );
  }
}
