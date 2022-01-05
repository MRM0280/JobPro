import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/home/home.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign up', style: appBarTitleStyle),
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
                Text(
                  'Welcome',
                  style: headingStyle,
                ),
                heightSpace,
                Text(
                  'Complete the form to create an account',
                  style: listTileSubTitleStyle,
                ),
                heightSpace,
                heightSpace,
                TextField(
                  style: listTileSubTitleStyle,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
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
                      'Create Account'.toUpperCase(),
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
