import 'package:amazon/animations/fade_animation.dart';
import 'package:amazon/pages/home_page.dart';
import 'package:amazon/pages/login.dart';
import 'package:amazon/pages/splash_page.dart';
import 'package:amazon/pages/signUp_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
      routes: {
        Home().id : (context) => Home(),
        Splash().id : (context) => Splash(),
        LogIn().id : (context) => LogIn(),
        SignIn().id : (context) => SignIn(),
      },
    );
  }
}