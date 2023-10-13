import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  static const String screed_id = 'AdminScreen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Admin Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                if (sp.getBool('savedSession') ?? false) {
                  sp.clear();
                  Navigator.pushReplacementNamed(
                      context, LogInScreen.screen_id);
                  /*
                  Navigator.pop(context);
                  Navigator.pushNamed(context, LogInScreen.screen_id);
                  */
                } else {
                  sp.clear();
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Log Out'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
