import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          heightSpace,
          heightSpace,
          Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            child: Image.asset(
              'assets/about_app.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
            child: Text(
              'Job Listing',
              style: headingStyle,
            ),
          ),
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
            child: Text(
              'With verified, up-to-date job listings, we create a premium experience for job seekers, employers and data seekers alike.',
              style: listTileSubTitleStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Container(
            padding: EdgeInsets.all(fixPadding),
            child: InkWell(
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
                  'Close'.toUpperCase(),
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
