import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:job_pro/pages/home/job_details.dart';
import 'package:page_transition/page_transition.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  final jobsList = [
    {
      'title': 'Laravel Developer',
      'company': 'NewTech Technology',
      'date': '20 June 2020',
      'experience': '1-2 years'
    },
    {
      'title': 'Javascript Developer',
      'company': 'Google LLC',
      'date': '23 June 2020',
      'experience': '7-8 years'
    },
    {
      'title': 'Android Developer',
      'company': 'MasterMind Technology',
      'date': '20 June 2020',
      'experience': '1-2 years'
    },
    {
      'title': 'Full Stack Web Developer',
      'company': 'RenderCode Technology LLC',
      'date': '24 June 2020',
      'experience': '4-5 years'
    },
    {
      'title': 'React Native Developer',
      'company': 'Facebook Inc',
      'date': '15 June 2020',
      'experience': '4-5 years'
    },
    {
      'title': 'Python Developer',
      'company': 'TechnicalLab Inc',
      'date': '15 June 2020',
      'experience': '4-5 years'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Results', style: appBarTitleStyle),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: fixPadding, right: fixPadding, left: fixPadding),
        child: ListView.builder(
          itemCount: jobsList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = jobsList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: fixPadding),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: JobDetails()));
                },
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.access_time,
                                  color: greyColor, size: 18.0),
                              SizedBox(width: 3.0),
                              Text(
                                item['date'],
                                style: dateExperienceStyle,
                              ),
                            ],
                          ),
                          SizedBox(width: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.flash_on,
                                  color: greyColor, size: 18.0),
                              SizedBox(width: 3.0),
                              Text(
                                'Experience: ${item['experience']}',
                                style: dateExperienceStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}