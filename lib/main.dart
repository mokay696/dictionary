import 'package:flutter/material.dart';
import 'password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary: English to Turkish',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const PasswordPage(),
    );
  }
}
