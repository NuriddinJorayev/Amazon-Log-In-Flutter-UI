import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String id = "home_page";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Amazon',
          style: TextStyle(fontFamily: 'Billabong', fontSize: 30.0),
        ),
      ),
      body: Center(
        child: Text('Welcome to Amazon', style: TextStyle( fontSize: 30.0),),
      ),
    );
  }
}
