import 'dart:io';
import 'dart:ui';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/home/home_main.dart';
import 'package:job_pro/pages/search/search.dart';
import 'package:job_pro/pages/saved_job.dart';
import 'package:job_pro/pages/profile/profile.dart';
import 'package:job_pro/pages/settings/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Colors.white,
        hasNotch: false,
        opacity: 0.2,
        hasInk: true,
        inkColor: Colors.blue[200],
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: blueColor,
            icon: Icon(
              Icons.work,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.work,
              color: blueColor,
            ),
            title: Text('Jobs', style: TextStyle(fontSize: 12.0)),
          ),
          BubbleBottomBarItem(
            backgroundColor: blueColor,
            icon: Icon(
              Icons.search,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: blueColor,
            ),
            title: Text('Search', style: TextStyle(fontSize: 12.0)),
          ),
          BubbleBottomBarItem(
            backgroundColor: blueColor,
            icon: Icon(
              Icons.bookmark_border,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.bookmark,
              color: blueColor,
            ),
            title: Text('Saved', style: TextStyle(fontSize: 12.0)),
          ),
          BubbleBottomBarItem(
            backgroundColor: blueColor,
            icon: Icon(
              Icons.person,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.person,
              color: blueColor,
            ),
            title: Text('Profile', style: TextStyle(fontSize: 12.0)),
          ),
          BubbleBottomBarItem(
            backgroundColor: blueColor,
            icon: Icon(
              Icons.settings,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: blueColor,
            ),
            title: Text('Settings', style: TextStyle(fontSize: 12.0)),
          ),
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? HomeMain()
            : (currentIndex == 1)
                ? Search()
                : (currentIndex == 2)
                    ? SavedJob()
                    : (currentIndex == 3)
                        ? Profile()
                        : Settings(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
      );
      return Future.value(false);
    } else {
      return true;
    }
  }
}
