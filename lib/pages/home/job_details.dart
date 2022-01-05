import 'package:flutter/material.dart';
import 'package:job_pro/constant/constants.dart';

class JobDetails extends StatefulWidget {
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  bool saved = false;
  bool applied = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    applyDialogue() {
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
              height: 155.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You sure want to apply for this job?",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                          setState(() {
                            applied = true;
                            Navigator.pop(context);
                          });
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
                            'I\'m Sure'.toUpperCase(),
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

    nothingHappen() {}

    getBottomNavigationBar(BuildContext context) {
      return Container(
        width: width,
        color: whiteColor,
        padding: EdgeInsets.all(fixPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {
                (applied) ? nothingHappen() : applyDialogue();
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (applied) ? greyColor : blueColor,
                ),
                child: Text(
                  (applied)
                      ? 'Applied for this job'.toUpperCase()
                      : 'Apply For This Job'.toUpperCase(),
                  style: buttonTextStyle,
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: () {
                setState(() {
                  saved = !saved;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text((saved)
                        ? 'Added to Saved Jobs'
                        : 'Removed from Saved Jobs'),
                  ),
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Icon(
                  (saved) ? Icons.bookmark : Icons.bookmark_border,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          'Job Details',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomNavigationBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Job Details start Here
              Container(
                width: width,
                color: whiteColor,
                padding: EdgeInsets.all(fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/job-icon.png',
                      width: 85.0,
                      fit: BoxFit.fitWidth,
                    ),
                    widthSpace,
                    Container(
                      width: width - 130.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ui developer intern'.toUpperCase(),
                            style: headingStyle,
                          ),
                          Text(
                            'Urgentboeck Software International - O\'Fallon, MO',
                            style: companyStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Job Details Ends Here
              // Description Start Here
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Text(
                  'Job Description'.toUpperCase(),
                  style: headingStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.all(fixPadding),
                color: whiteColor,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  style: descriptionStyle,
                  textAlign: TextAlign.justify,
                ),
              ),
              // Description Ends Here

              // Field/Category Start Here
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Text(
                  'Field/Category'.toUpperCase(),
                  style: headingStyle,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(fixPadding),
                color: whiteColor,
                child: Wrap(
                  children: <Widget>[
                    getTile('Tech'.toUpperCase()),
                    widthSpace,
                    getTile('Fashion'.toUpperCase()),
                  ],
                ),
              ),
              // Field/Category Ends Here

              // Benifits Start Here
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Text(
                  'Benifits'.toUpperCase(),
                  style: headingStyle,
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(fixPadding),
                color: whiteColor,
                child: Wrap(
                  children: <Widget>[
                    getTile('Remote'.toUpperCase()),
                    widthSpace,
                    getTile('Paid Vacation'.toUpperCase()),
                    widthSpace,
                    getTile('Pet Friendly'.toUpperCase()),
                  ],
                ),
              ),
              // Benifits Ends Here
            ],
          ),
          heightSpace,
        ],
      ),
    );
  }

  getTile(String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: blackColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: whiteColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
