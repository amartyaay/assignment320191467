import 'package:flutter/material.dart';
import '../utilities/constants.dart';
// import '../utilities/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';

int display = 0;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // BottomBar bar = BottomBar();
  void setDisplayStyle(int newValue) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('displayStyle', display);
  }

  void getDisplayStyle() async {
    final pref = await SharedPreferences.getInstance();
    display = pref.getInt('displayStyle')!.toInt();
  }

  @override
  void initState() {
    super.initState();
    getDisplayStyle();
    // setDisplayStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Display Style',
                style: TextStyle(
                  color: kColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: display,
                        onChanged: (int? newValue) {
                          setState(
                            () {
                              print('new value is');
                              // print(newValue);
                              display = newValue!.toInt();
                            },
                          );
                          setDisplayStyle(newValue!.toInt());
                        },
                      ),
                      Text(
                        'ID',
                        style: TextStyle(
                          color: kColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: display,
                        onChanged: (int? newValue) {
                          setState(
                            () {
                              // print(newValue);
                              display = newValue!.toInt();
                            },
                          );
                          setDisplayStyle(newValue!.toInt());
                        },
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          color: kColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // bar,
            ],
          ),
        ),
      ),
    );
  }
}
