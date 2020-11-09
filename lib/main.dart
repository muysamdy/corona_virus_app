import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This Widget is the root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restful API',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1010101),
        cardColor: Color(0xFF222222),
      ),
      home: Container(),
    );
  }
}



void main() => runApp(MyApp());