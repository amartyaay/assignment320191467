import 'package:assignment320191467/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/bottombar.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  final scoreController = TextEditingController(text: '3');
  String dropdownValue = '5';
  void saveData() async {
    final pref = await SharedPreferences.getInstance();
    // pref.
    pref.setString('score', scoreController.text);
    pref.setString('assignment', dropdownValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    scoreController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Track'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Assignment',
              style: TextStyle(color: kColor, fontWeight: FontWeight.w700),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: TextStyle(color: kColor),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['1', '2', '3', '4', '5', '6']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Score',
              style: TextStyle(
                color: kColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: scoreController,
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                fillColor: Colors.black12,
                focusColor: Colors.green,
                hintText: 'Enter Score',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                decoration: BoxDecoration(
                  color: kColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(20),
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
          ],
        ),
      ),
    );
  }
}
