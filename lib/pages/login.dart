import 'dart:async';
import 'dart:ui';

import 'package:amazon/animations/fade_animation.dart';
import 'package:amazon/pages/signUp_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LogIn extends StatefulWidget {
  final String id = "logIng_page";

  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool isSignup = false;
  bool isLogin = false;

  final _border = BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.grey[200],
  );

  _signUp_page(int i) {
    setState(() {
      if (i == 0) {
        isLogin = true;
      } else {
        isSignup = true;
      }
    });
    Timer(Duration(seconds: 4), () {
      if (i == 0) {
        if (email_controller.text.isNotEmpty &&
            password_controller.text.isNotEmpty) {
          Navigator.pushReplacementNamed(context, Home().id);
          isLogin = false;
        } else {
          setState(() {
            isLogin = false;
          });
        }
      } else {
        Navigator.pushReplacementNamed(context, SignIn().id);
        isSignup = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // main container
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  instagram lable
            FadeAnimation(1000,Text(
              'Amazon',
              style: TextStyle(
                  fontSize: 45.0, fontFamily: 'Billabong', letterSpacing: 1.3),
            ), width,),
            // Email panel
            FadeAnimation(1200,Container(
              margin: EdgeInsets.only(top: 15.0),
              decoration: _border,
              height: 48.0,
              child: TextField(
                controller: email_controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Email",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
            ), width,),
            // Password panel
            FadeAnimation(1400,Container(
              margin: EdgeInsets.only(top: 15.0),
              decoration: _border,
              height: 48.0,
              child: TextField(
                controller: password_controller,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Password",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
            ), width,),
            // Sing in button
            FadeAnimation(1600,Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              decoration: _border,
              height: 48.0,
              child: MaterialButton(
                color: Colors.red,
                onPressed: () {
                  _signUp_page(0);
                },
                child: !isLogin
                    ? Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )
                    : CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ), width,),
            // don't have an account panel
            FadeAnimation(1800,
              !isSignup
                  ? Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                      letterSpacing: 1.1
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        _signUp_page(1);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3),
                      ),
                    ),
                  ],
                ),
              )
                  : Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
              width,),
          ],
        ),
      ),
    );
  }

}
