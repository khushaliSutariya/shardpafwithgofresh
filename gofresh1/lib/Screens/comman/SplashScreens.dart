import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gofresh1/auth/NewAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/Loginpage.dart';
import 'NavigationbarScreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void resetNewLaunch() async {
    Timer(Duration(seconds: 3), () async {
      if (!mounted) return;
      SharedPreferences _prefs =
      await SharedPreferences.getInstance();
      if(_prefs.containsKey("login")){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  NavigationbarScreen()));
      }
       else if(_prefs.containsKey("useremail") && _prefs.containsKey("userpass"))
      {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  Loginpage()));
      }
      else
      {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  NewAccount()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    resetNewLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("img/logo.png"),
          ],
        ),
      ),
    );
  }
}
