import 'package:beauty_parlour/model/log.dart';
import 'package:beauty_parlour/model/loginPage.dart';
import 'package:beauty_parlour/model/signUpPage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}
