import 'package:flutter/material.dart';
import '/screens/login.dart';

void main() {
  runApp(Assignment3());
}

class Assignment3 extends StatelessWidget {
  const Assignment3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
