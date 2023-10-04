import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exercises/services/auth_services.dart';
import 'package:riverpod_exercises/views/screens/home_screen.dart';
import 'package:riverpod_exercises/views/screens/login_screen.dart';

void main() async {
  runApp(const ProviderScope(child: (MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _token = ref.watch(getTokenProvider);
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: _token.when(
        data: (data) {
          if (data != null) {
            return const HomeScreen();
          } else {
            return LoginScreen();
          }
        },
        error: (error, stacktrace) => LoginScreen(),
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      routes: {
        "/Home": (context) => const HomeScreen(),
        "/Login": (context) => LoginScreen(),
      },
    );
  }
}
