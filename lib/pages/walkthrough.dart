import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/login_signup/login.dart';
import 'package:job_pro/pages/login_signup/signup.dart';
import 'package:page_transition/page_transition.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            Positioned(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                bottomNavigationBar: Material(
                  elevation: 5.0,
                  child: Container(
                    color: Colors.white,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: SignUp()));
                          },
                          child: Container(
                            width: ((width) / 2),
                            height: 50.0,
                            alignment: Alignment.center,
                            color: whiteColor,
                            child: Text(
                              'Create Account'.toUpperCase(),
                              style: createAccountTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Login()));
                          },
                          child: Container(
                            width: ((width) / 2),
                            height: 50.0,
                            alignment: Alignment.center,
                            color: blueColor,
                            child: Text(
                              'Sign In'.toUpperCase(),
                              style: signInTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.all(fixPadding),
                  height: height,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to Job Listing'.toUpperCase(),
                        style: welcomeTextStyle,
                      ),
                      heightSpace,
                      Text(
                        'With verified, up-to-date job listings, we create a premium experience for job seekers, employers and data seekers alike.',
                        style: searchDescStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
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
