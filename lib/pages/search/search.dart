import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:job_pro/constant/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:job_pro/pages/search/search_result.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double salaryStartPoint = 3500;
  double salaryEndPoint = 7790;
  double salaryMaxPoint = 10000;
  double tempSalaryStartPoint = 3500;
  double tempSalaryEndPoint = 7790;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    updateSalaryRange() {
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
              height: 230.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose Salary Range",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  heightSpace,
                  FlutterSlider(
                    values: [salaryStartPoint, salaryEndPoint],
                    rangeSlider: true,
                    max: salaryMaxPoint,
                    min: 0,
                    tooltip: FlutterSliderTooltip(
                      leftPrefix: Icon(
                        Icons.attach_money,
                        size: 19,
                        color: Colors.black45,
                      ),
                      rightSuffix: Icon(
                        Icons.attach_money,
                        size: 19,
                        color: Colors.black45,
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      tempSalaryStartPoint = lowerValue;
                      tempSalaryEndPoint = upperValue;
                    },
                  ),
                  heightSpace,
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
                            setState(() {
                              salaryStartPoint = tempSalaryStartPoint;
                              salaryEndPoint = tempSalaryEndPoint;
                            });
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
                            'Ok'.toUpperCase(),
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
        title: Text('Find Jobs', style: appBarTitleStyle),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Image Section Start Here
          SizedBox(
            width: width,
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/search-bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: 200.0,
                  alignment: Alignment.center,
                  color: blackColor.withOpacity(0.6),
                  child: Padding(
                    padding: EdgeInsets.all(fixPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Search and filter jobs to find the perfect match for you.',
                          style: searchDescStyle,
                          textAlign: TextAlign.center,
                        ),
                        heightSpace,
                        heightSpace,
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                          ),
                          child: TextField(
                            style: headingStyle,
                            onSubmitted: (v) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: SearchResult()));
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12.0),
                              hintText: 'Search Jobs',
                              hintStyle: descriptionStyle,
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: SearchResult()));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image Section Ends Here

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
            padding:
                EdgeInsets.fromLTRB(fixPadding, 0.0, fixPadding, fixPadding),
            color: whiteColor,
            child: Wrap(
              children: <Widget>[
                getTile('Tech'.toUpperCase()),
                widthSpace,
                getTile('Banking'.toUpperCase()),
                widthSpace,
                getTile('Fashion'.toUpperCase()),
                widthSpace,
                getTile('Construction'.toUpperCase()),
              ],
            ),
          ),
          // Field/Category Ends Here

          // Benefits Start Here
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              'Benefits'.toUpperCase(),
              style: headingStyle,
            ),
          ),
          Container(
            width: width,
            padding:
                EdgeInsets.fromLTRB(fixPadding, 0.0, fixPadding, fixPadding),
            color: whiteColor,
            child: Wrap(
              children: <Widget>[
                getTile('Remote'.toUpperCase()),
                widthSpace,
                getTile('401K'.toUpperCase()),
                widthSpace,
                getTile('Paid Vacation'.toUpperCase()),
                widthSpace,
                getTile('Pet Friendly'.toUpperCase()),
              ],
            ),
          ),
          // Benefits Ends Here

          // Salary Range Start Here
          InkWell(
            onTap: () {
              updateSalaryRange();
            },
            child: Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Text(
                'Salary Range:   \$$salaryStartPoint - \$$salaryEndPoint'
                    .toUpperCase(),
                style: headingStyle,
              ),
            ),
          ),
          // Salary Range Ends Here
        ],
      ),
    );
  }

  getTile(String title) {
    return Padding(
      padding: EdgeInsets.only(top: fixPadding),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: SearchResult()));
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: blackColor,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
