import 'package:flutter/material.dart';
import 'package:my_portfolio/HomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lets Coffee',
      // theme: ThemeData(
      //   // primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   // brightness: Brightness.dark,
      // ),
      home: MyHomePage(),
    );
  }
}






