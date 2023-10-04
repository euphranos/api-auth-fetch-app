import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exercises/controllers/auth_controller.dart';
import 'package:riverpod_exercises/models/user_model.dart';
import 'package:riverpod_exercises/services/auth_services.dart';
import 'package:riverpod_exercises/services/services.dart';
import 'package:riverpod_exercises/views/widgets/user_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    final userLoginProvider = ref.watch(authProvider);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              logOutUser(context, userLoginProvider);
            },
          ),
          body: _data.when(
            data: (data) {
              List<UserModel> _allUsers = data;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "List of Users",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _allUsers.length,
                        itemBuilder: (context, index) => Card(
                          color: Colors.orange,
                          child: UserCardWidget(user: _allUsers[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
