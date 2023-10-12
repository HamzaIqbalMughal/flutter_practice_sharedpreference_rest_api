import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/home_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String screen_id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LogInScreen.screen_id);
    });

  }

  @override
  Widget build(BuildContext context) {
    print('in build method');
    return Scaffold(
      // body: Image(
      //   height: double.infinity,
      //   fit: BoxFit.fitHeight,
      //   image: NetworkImage(
      //       'https://images.pexels.com/photos/3826676/pexels-photo-3826676.jpeg'),
      // ),
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
