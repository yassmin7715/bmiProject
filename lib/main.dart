import 'package:flutter/material.dart';
import 'HomePage.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF303030),
        scaffoldBackgroundColor: Color(0xFF212121),
      ),
      home: MyHomePage(),
    );
  }
}

