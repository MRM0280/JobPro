import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/home/home.dart';
import 'package:job_pro/pages/login_signup/forgot_password.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign in', style: appBarTitleStyle),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          heightSpace,
          Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  style: listTileSubTitleStyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                TextField(
                  style: listTileSubTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  obscureText: true,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                InkWell(
                  borderRadius: BorderRadius.circular(5.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Home()));
                  },
                  child: Container(
                    height: 50.0,
                    width: width - (fixPadding * 2.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: blueColor,
                    ),
                    child: Text(
                      'Sign In'.toUpperCase(),
                      style: buttonTextStyle,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ForgotPassword()));
                  },
                  child: Container(
                      width: width - (fixPadding * 2),
                      padding: EdgeInsets.all(fixPadding),
                      child: Text('Forgot Password?',
                          style: headingStyle, textAlign: TextAlign.center)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
