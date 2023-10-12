import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static const String screen_id = 'LogInScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'password'
              ),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', 'Hamza Iqbal');
                sp.setInt('age', 23);
                sp.setBool('isLogin', true);

                // Fluttertoast.showToast(msg: 'Button Clicked');
                // myFutureFunc();
                print(sp.get('name'));   // print(sp.getString('name'));
                print(sp.get('age'));
                print(sp.getBool('isLogin').toString());

                sp.remove('name');

              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> myFutureFunc() async {
    await Future.delayed(Duration(seconds: 5));
    print('delayed');
  }
}
