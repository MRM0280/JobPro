import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool one = true, two = false, three = false;
  String name = 'Allison Perry';
  String email = 'allison@test.com';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var qualificationController = TextEditingController();
  var fieldCategoryController = TextEditingController();
  var experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
    qualificationController.text = '';
    fieldCategoryController.text = '';
    experienceController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile', style: appBarTitleStyle),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if ((two = true) || (three = true)) {
                      setState(() {
                        one = true;
                        two = false;
                        three = false;
                      });
                    }
                  },
                  child: number(
                    ((one)
                        ? whiteColor
                        : (two)
                            ? blueColor
                            : blueColor),
                    ((one)
                        ? blueColor
                        : (two)
                            ? blueColor
                            : blueColor),
                    ((one)
                        ? blackColor
                        : (two)
                            ? whiteColor
                            : whiteColor),
                    '1',
                  ),
                ),
                line(((one)
                    ? greyColor
                    : (two)
                        ? blueColor
                        : blueColor)),
                InkWell(
                  onTap: () {
                    if (three) {
                      setState(() {
                        one = false;
                        two = true;
                        three = false;
                      });
                    }
                  },
                  child: number(
                    ((one)
                        ? whiteColor
                        : (two)
                            ? whiteColor
                            : blueColor),
                    ((one)
                        ? greyColor
                        : (two)
                            ? blueColor
                            : blueColor),
                    ((one)
                        ? whiteColor
                        : (two)
                            ? blackColor
                            : whiteColor),
                    '2',
                  ),
                ),
                line(((one)
                    ? greyColor
                    : (two)
                        ? greyColor
                        : blueColor)),
                number(
                  ((one)
                      ? whiteColor
                      : (two)
                          ? whiteColor
                          : whiteColor),
                  ((one)
                      ? greyColor
                      : (two)
                          ? greyColor
                          : blueColor),
                  ((one)
                      ? whiteColor
                      : (two)
                          ? whiteColor
                          : blackColor),
                  '3',
                )
              ],
            ),
          ),
          heightSpace,
          (one)
              ? personalInfoEdit(width)
              : (two)
                  ? experienceEdit(width)
                  : done(width),
        ],
      ),
    );
  }

  Widget line(Color color) {
    return Container(
      color: color,
      height: 1.5,
      width: 60.0,
    );
  }

  Widget number(
      Color bgColor, Color borderColor, Color textColor, String number) {
    return Container(
      height: 30.0,
      width: 30.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: bgColor,
        border: Border.all(width: 1.0, color: borderColor),
      ),
      child: Text(number, style: TextStyle(color: textColor, fontSize: 12.0)),
    );
  }

  personalInfoEdit(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Personal Information',
            style: headingStyle,
          ),
          heightSpace,
          Text(
            'Tell us a little about you',
            style: listTileSubTitleStyle,
          ),
          heightSpace,
          heightSpace,
          TextField(
            controller: nameController,
            style: listTileSubTitleStyle,
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          heightSpace,
          TextField(
            controller: emailController,
            style: listTileSubTitleStyle,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Your Email Address',
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
          heightSpace,
          InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () {
              setState(() {
                one = false;
                two = true;
                three = false;
              });
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
                'Next'.toUpperCase(),
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  experienceEdit(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Professional Experience',
            style: headingStyle,
          ),
          heightSpace,
          Text(
            'Provide some details about your career',
            style: listTileSubTitleStyle,
          ),
          heightSpace,
          heightSpace,
          TextField(
            controller: qualificationController,
            style: listTileSubTitleStyle,
            decoration: InputDecoration(
              hintText: 'Qualification',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          heightSpace,
          TextField(
            controller: fieldCategoryController,
            style: listTileSubTitleStyle,
            decoration: InputDecoration(
              hintText: 'Field/Category',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          heightSpace,
          TextField(
            controller: experienceController,
            style: listTileSubTitleStyle,
            decoration: InputDecoration(
              hintText: 'Years of Experience',
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
          heightSpace,
          InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () {
              setState(() {
                one = false;
                two = false;
                three = true;
              });
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
                'Next'.toUpperCase(),
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  done(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          heightSpace,
          heightSpace,
          Container(
            width: width,
            child: Image.asset(
              'assets/done.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'You\'re all set',
            style: headingStyle,
          ),
          heightSpace,
          Text(
            'Your profile details has been saved',
            style: listTileSubTitleStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 50.0,
              width: width - (fixPadding * 2.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: blueColor,
              ),
              child: Text(
                'Done'.toUpperCase(),
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
