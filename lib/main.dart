import 'package:flutter/material.dart';
import 'package:shared_pref/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  
  bool user = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

 void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('user') != null) {
      setState(() {
        user = prefs.getBool('user');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xffF5F6F8),
        fontFamily: "Nunito",
      ),
      title: 'Shared Preference',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(user),
    );
  }
}