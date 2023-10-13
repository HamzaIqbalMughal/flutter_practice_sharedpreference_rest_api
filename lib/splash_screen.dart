import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/admin_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/home_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/login_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/studentScreen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String screen_id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLogIn();
    super.initState();
  }

  void isLogIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogIn = sp.getBool('isLogIn') ?? false;

    Timer(
      Duration(seconds: 3),
      () {
        if (isLogIn) {
          if (sp.getString('userType') == 'student') {
            Navigator.pushReplacementNamed(context, StudentScreen.screen_id);
          } else if (sp.getString('userType') == 'admin') {
            Navigator.pushNamed(context, AdminScreen.screed_id);
          } else if (sp.getString('userType') == 'teacher') {
            Navigator.pushNamed(context, TeacherScreen.screen_id);
          }
          sp.setBool('savedSession', true);
        } else {
          Navigator.pushReplacementNamed(context, LogInScreen.screen_id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('in build method');
    return Scaffold(
      body: SafeArea(
        child: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/welcomepic.jpg'),
        ),
      ),
    );
  }
}
