// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:riverpod_exercises/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel user;
  const UserCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      title: Text(
        user.fistName + user.lastName,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
