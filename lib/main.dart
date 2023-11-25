import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_screen/screens/home.dart';
import 'package:signup_screen/screens/slider.dart';
import 'screens/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String fname;

  @override
  void initState() {
    super.initState();
    getValidation();
  }

  Future<void> getValidation() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainemail = pref.getString('username');
    setState(() {
      fname = obtainemail!;
    });
    print(fname);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Carouslider(),
    );
  }
}