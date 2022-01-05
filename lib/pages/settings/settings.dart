import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/settings/about_us.dart';
import 'package:job_pro/pages/walkthrough.dart';
import 'package:page_transition/page_transition.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool emailStatus = true;
  bool analyticStatus = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    logoutDialogue() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 130.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You sure want to logout?",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel'.toUpperCase(),
                            style: cancelButtonDialogTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Walkthrough()));
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Log out'.toUpperCase(),
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Settings', style: appBarTitleStyle),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Personalize Start Here
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              'Personalize'.toUpperCase(),
              style: headingStyle,
            ),
          ),
          Container(
            color: whiteColor,
            child: ListTile(
              leading: Icon(Icons.notifications, color: blueColor, size: 25.0),
              title: Text('Email Alerts', style: listTileSubTitleStyle),
              trailing: CustomSwitch(
                activeColor: blueColor,
                value: emailStatus,
                onChanged: (value) {
                  setState(() {
                    emailStatus = value;
                  });
                },
              ),
            ),
          ),
          Container(
            color: whiteColor,
            child: ListTile(
              leading: Icon(Icons.graphic_eq, color: blueColor, size: 25.0),
              title: Text('Share analytics info', style: listTileSubTitleStyle),
              trailing: CustomSwitch(
                activeColor: blueColor,
                value: analyticStatus,
                onChanged: (value) {
                  setState(() {
                    analyticStatus = value;
                  });
                },
              ),
            ),
          ),
          // Personalize Ends Here

          // General Settings Start Here
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              'General Settings'.toUpperCase(),
              style: headingStyle,
            ),
          ),
          Container(
            color: whiteColor,
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: AboutUs()));
                },
                leading: Icon(Icons.info, color: blueColor, size: 25.0),
                title: Text('About Us', style: listTileSubTitleStyle),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: blackColor, size: 25.0)),
          ),
          Container(
            color: whiteColor,
            child: ListTile(
                onTap: () {
                  logoutDialogue();
                },
                leading: Icon(Icons.exit_to_app, color: greyColor, size: 25.0),
                title: Text('Sign Out', style: listTileSubTitleStyle),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: blackColor, size: 25.0)),
          ),
          // General Settings Ends Here
        ],
      ),
    );
  }
}
