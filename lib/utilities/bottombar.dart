import 'package:flutter/material.dart';
import 'constants.dart';
import '../screens/home.dart';
import '../screens/settings.dart';
import '../screens/track.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  // BottomBar({this.id = '', this.name = ''});

  @override
  _BottomBarState createState() => _BottomBarState();
}

Home home = Home();
Settings settings = Settings();
Track track = Track();

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  void onChangeIndex(int currentIndex) {
    setState(() {
      index = currentIndex;
    });
  }

  List widgetOption = [home, settings, track];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: widgetOption.elementAt(index),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: kInactiveIconColor,
                ),
                label: 'home',
                activeIcon: Icon(
                  Icons.home_filled,
                  color: kActiveIconColor,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: kInactiveIconColor,
                ),
                label: 'settings',
                activeIcon: Icon(
                  Icons.settings,
                  color: kActiveIconColor,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: kInactiveIconColor,
                ),
                label: 'track',
                activeIcon: Icon(
                  Icons.book_outlined,
                  color: kActiveIconColor,
                )),
          ],
          backgroundColor: kColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: kActiveIconColor,
          currentIndex: index,
          onTap: onChangeIndex,
        ));
  }
}
