import 'package:flutter/material.dart';
import 'package:passing_data/screen_2.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        primaryColor: Color(0xFF55C1EF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/screen2': (context) => Screen2(),
      },
    );
  }
}
