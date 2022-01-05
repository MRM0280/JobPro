import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:job_pro/pages/profile/edit_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Profile', style: appBarTitleStyle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, color: whiteColor),
            onPressed: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: EditProfile()));
            },
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // About you start here
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              'About You'.toUpperCase(),
              style: headingStyle,
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: AssetImage('assets/user_profile/user_3.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                heightSpace,
                Text('Allison Perry', style: headingStyle),
                SizedBox(height: 3.0),
                Text('allison@test.com', style: descriptionStyle),
              ],
            ),
          ),
          // About you ends here

          // Professional Experience start here
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              'Professional Experience'.toUpperCase(),
              style: headingStyle,
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                getListTile(Icon(Icons.school, color: greyColor, size: 35.0),
                    'Qualification', 'M.Sc Computer Science'),
                getListTile(
                    Icon(Icons.content_copy, color: greyColor, size: 35.0),
                    'Field/Category',
                    'Computer Science'),
                getListTile(
                    Icon(Icons.access_time, color: greyColor, size: 35.0),
                    'Year of Experience',
                    '3 Years'),
              ],
            ),
          ),
          // Professional Experience ends here
        ],
      ),
    );
  }

  getListTile(Icon icon, String title, String subTitle) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: companyStyle,
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Text(
          subTitle,
          style: headingStyle,
        ),
      ),
    );
  }
}
