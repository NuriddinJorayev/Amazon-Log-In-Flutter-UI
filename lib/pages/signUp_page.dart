import 'dart:async';

import 'package:amazon/pages/login.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SignIn extends StatefulWidget {
  final String id = "signIn_page";
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController name_controller = TextEditingController();
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
        if (name_controller.text.isNotEmpty &&
        email_controller.text.isNotEmpty &&
        password_controller.text.isNotEmpty){
          Navigator.pushReplacementNamed(context, Home().id);
          isLogin = false;
        }else{
          setState(() {
            isLogin = false;
          });
        }
      } else {
        Navigator.pushReplacementNamed(context, LogIn().id);
        isSignup = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // main container
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Amazon',
              style: TextStyle(
                  fontSize: 45.0,
                  fontFamily: 'Billabong',
                  letterSpacing: 1.3
              ),
            ),

            // name panel
            Container(
              margin: EdgeInsets.only(top: 15.0),
              decoration: _border,
              height: 48.0,
              child: TextField(
                controller: name_controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Name",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
            ),
            // Email panel
            Container(
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
            ),
            // Password panel
            Container(
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
            ),
            // Sing in button
            Container(
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
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                  letterSpacing: 1.2
                  ),
                )
                    : CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            // don't have an account panel
            !isSignup
                ? Container(
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () {
                      _signUp_page(1);
                    },
                    child: Text(
                      "Log in",
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
            )
          ],
        ),
      ),
    );
  }
}

