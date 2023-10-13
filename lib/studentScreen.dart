import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class StudentScreen extends StatefulWidget {

  const StudentScreen({super.key});

  static const String screen_id = 'StudentScreen';

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = '', age = '';
  List<String> credentialsList = <String>[];
  String dropDownFirstVal = '';
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    credentialsList.add(email);
    credentialsList.add(age);
    dropDownFirstVal = credentialsList.first;
    isDataLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Student Home'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: dropDownFirstVal,
                items: credentialsList
                    .map<DropdownMenuItem<String>>((String value) {
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
                  // sp.setBool('isLogIn', false);
                  sp.clear();
                  Navigator.pushNamed(context, LogInScreen.screen_id);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
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
}
