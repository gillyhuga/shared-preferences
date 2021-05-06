import 'package:flutter/material.dart';
import 'package:shared_pref/splashScreen.dart';
// import 'package:shared_pref/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xffF5F6F8),
        fontFamily: "Nunito",
      ),
      title: 'Shared Preference',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}