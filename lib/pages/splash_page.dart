import 'dart:async';

import 'package:amazon/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:amazon/pages/signUp_page.dart';

import 'home_page.dart';


class Splash extends StatefulWidget {
  final String id = "splash_page";
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, LogIn().id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Center(
            child: Image(
              height: 100.0,
              width: 100.0,
              image: AssetImage('assets/images/amzon3.png'),
            ),
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text("From Amazon",
                  style: TextStyle(fontSize: 18, color: Colors.grey),),
                ),
                SizedBox(height: 20.0,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

