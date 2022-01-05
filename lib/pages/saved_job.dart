import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/home/job_details.dart';
import 'package:page_transition/page_transition.dart';

class SavedJob extends StatefulWidget {
  @override
  _SavedJobState createState() => _SavedJobState();
}

class _SavedJobState extends State<SavedJob> {
  int savedJobItem = 5;

  final jobsList = [
    {
      'title': 'Full Stack Web Developer',
      'company': 'RenderCode Technology LLC',
      'image': 'assets/job-icon.png',
      'status': 'apply'
    },
    {
      'title': 'Javascript Developer',
      'company': 'Google LLC',
      'image': 'assets/google.png',
      'status': 'applied'
    },
    {
      'title': 'React Native Developer',
      'company': 'Facebook Inc',
      'image': 'assets/facebook.png',
      'status': 'apply'
    },
    {
      'title': 'Flutter Developer',
      'company': 'Google LLC',
      'image': 'assets/google.png',
      'status': 'apply'
    },
    {
      'title': 'Data Mining Expert',
      'company': 'Facebook Inc',
      'image': 'assets/facebook.png',
      'status': 'applied'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Saved', style: appBarTitleStyle),
      ),
      body: (savedJobItem == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'No Saved Job',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: jobsList.length,
              itemBuilder: (context, index) {
                final item = jobsList[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: IconSlideAction(
                        caption: 'Remove',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            jobsList.removeAt(index);
                            savedJobItem = savedJobItem - 1;
                          });

                          // Then show a snackbar.
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Job Removed from Saved Jobs'),
                          ));
                        },
                      ),
                    ),
                  ],
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(fixPadding),
                      color: whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 75.0,
                            width: 75.0,
                            child: Image.asset(item['image'],
                                fit: BoxFit.fitHeight),
                          ),
                          widthSpace,
                          Container(
                            width: width - 115.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item['title'].toUpperCase(),
                                  style: headingStyle,
                                ),
                                Text(
                                  item['company'],
                                  style: companyStyle,
                                ),
                                heightSpace,
                                (item['status'] == 'apply')
                                    ? InkWell(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child: JobDetails()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 8.0, 15.0, 8.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: blueColor,
                                          ),
                                          child: Text(
                                            'Apply',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: whiteColor,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text('Applied',
                                        style: dateExperienceStyle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
