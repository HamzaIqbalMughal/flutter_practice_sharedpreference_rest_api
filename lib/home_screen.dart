import 'package:flutter/material.dart';
import 'package:flutter_practice_sharedpreference_rest_api/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';

  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  List<String> credentialsList = <String>[];

  String dropDownInitialVal = list.first;

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
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Age : $age'),
              // SizedBox(
              //   height: 10,
              // ),
              // Text('Email : $email'),
              // SizedBox(
              //   height: 10,
              // ),
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
                  Navigator.pop(context);
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
