import 'package:assignment320191467/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../utilities/bottombar.dart';
import 'track.dart';
import 'login.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  // String display = this.name;

  @override
  _HomeState createState() => _HomeState();
}

// BottomBar bar = BottomBar();
String display = '0';
String idNo = '';
String studentName = '';
String displayStatus = idNo;
String score = '';
String assignment = '';
// String displayName = '';
Future<void> getData() async {
  final pref = await SharedPreferences.getInstance();
  display = pref.getInt('displayStyle').toString();
  idNo = (pref.getString('id')).toString();
  studentName = pref.getString('name').toString();
  score = pref.getString('score').toString();
  assignment = pref.getString('assignment').toString();
  if (assignment == 'null') assignment = '0';
  if (score == 'null') score = '25';
  // print(assignment);
  // print(idNo + '\tid no');
  // return pref.getString('name');
}

int assgn = int.parse(assignment);
int percentage = 0;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    changeState();
  }

  void changeState() async {
    await getData();
    setState(() {
      if (display == '0')
        displayStatus = idNo;
      else
        displayStatus = studentName;
      if (assignment == '')
        percentage = ((0 / 6) * 100).round();
      else
        percentage = (((int.parse(assignment)) / 6) * 100).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Hi ${displayStatus.toUpperCase()}',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: kColor,
              ),
            ),
            Container(
              // height: 60,
              // width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.teal.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your Progress',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$assignment/6',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'assignment done',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(50),
                              shape: BoxShape.circle,
                              color: kColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                '$percentage',
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(100),
                        shape: BoxShape.circle,
                        color: kColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '$score',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kColor,
                          // shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            'Track',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Track(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: GestureDetector(
                child: Container(
                  width: 120,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Log Out', style: TextStyle(fontSize: 20),
                        // style: kLargeButtonText,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  // width: double.infinity,
                ),
                onTap: () async {
                  // saveData();
                  final pref = await SharedPreferences.getInstance();
                  await pref.clear();
                  await pref.setBool('login', false);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
