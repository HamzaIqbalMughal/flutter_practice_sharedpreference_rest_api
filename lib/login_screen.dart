import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/admin_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/home_screen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/studentScreen.dart';
import 'package:flutter_practice_sharedpreference_rest_api/teacher_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static const String screen_id = 'LogInScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final logInFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  static const List<String> userTypes = <String>['student', 'admin', 'teacher'];

  String dropDownFirstVal = userTypes.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: dropDownFirstVal,
              items: userTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropDownFirstVal = value!;
                });
              },
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString('email', emailController.text.toString());
                sp.setString('userType', dropDownFirstVal);
                sp.setBool('isLogIn', true);

                if (sp.getString('userType') == 'student') {
                  Navigator.pushNamed(context, StudentScreen.screen_id);
                } else if (sp.getString('userType') == 'admin') {
                  Navigator.pushNamed(context, AdminScreen.screed_id);
                } else if (sp.getString('userType') == 'teacher') {
                  Navigator.pushNamed(context, TeacherScreen.screen_id);
                }
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
