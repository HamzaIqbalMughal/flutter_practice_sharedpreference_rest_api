import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/home_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/login_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: SplashScreen(),
      initialRoute: SplashScreen.screen_id,
      routes: {
        SplashScreen.screen_id : (context)=> SplashScreen(),
        HomeScreen.screen_id : (context)=> HomeScreen(),
        LogInScreen.screen_id : (context)=> LogInScreen(),
      },
    );
  }
}

