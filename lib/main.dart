import 'package:flutter/material.dart';
import 'package:healthui/landing_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}