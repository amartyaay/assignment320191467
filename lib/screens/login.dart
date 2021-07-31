import 'package:flutter/material.dart';
// import '/screens/home.dart';
import '/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/bottombar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('id', idController.text);
    prefs.setBool('login', true);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void checkLogIn() async {
    final pref = await SharedPreferences.getInstance();
    bool? logedIn = pref.getBool('login') ?? false;
    if (logedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogIn();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'CRuX FLUTTER SUMMER GROUP',
                    style: TextStyle(
                      color: kColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                // SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID Number'),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: idController,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Colors.black12,
                        focusColor: Colors.green,
                        hintText: 'Enter BITS ID',
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: nameController,
                      // obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Colors.black12,
                        focusColor: Colors.white,
                        hintText: 'Enter Name',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),

                GestureDetector(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Login',
                        // style: kLargeButtonText,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: kColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    // width: double.infinity,
                  ),
                  onTap: () {
                    saveData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBar(),
                      ),
                    );
                  },
                ),
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: kColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account'),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: kColor,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Register(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
