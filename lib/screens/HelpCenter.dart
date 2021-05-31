import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:gp/components/tools.dart';
// ignore: unused_import
import 'package:gp/components/maindrawer.dart';
// ignore: unused_import
import 'package:gp/main.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  List<bool> isTypeSelected = [false, false, false, true, true];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kgradintstartcolor,
      key: _drawerKey,
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 40, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(

              child: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: KMainColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text(
                "Please select the type of the feedback Or Enter other Problems",
                style: TextStyle(
                  color: KprimaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              child: buildCheckItem(
                  title: "Login trouble", isSelected: isTypeSelected[0]),
              onTap: () {
                setState(() {
                  isTypeSelected[0] = !isTypeSelected[0];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Calender related", isSelected: isTypeSelected[1]),
              onTap: () {
                setState(() {
                  isTypeSelected[1] = !isTypeSelected[1];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Personal profile", isSelected: isTypeSelected[2]),
              onTap: () {
                setState(() {
                  isTypeSelected[2] = !isTypeSelected[2];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Other issues", isSelected: isTypeSelected[3]),
              onTap: () {
                setState(() {
                  isTypeSelected[3] = !isTypeSelected[3];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Suggestions", isSelected: isTypeSelected[4]),
              onTap: () {
                setState(() {
                  isTypeSelected[4] = !isTypeSelected[4];
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            emailFeedbackForm(),
            SizedBox(height: 5.0),
            buildFeedbackForm(),
            SizedBox(height: 20.0),
            Spacer(),
            Row(
              children: [
                // ignore: deprecated_member_use
                Padding(
                  padding: const EdgeInsets.only(bottom:150.0,left: 100),
                  child: RaisedButton(onPressed: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: 130,

                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: KMainColor
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'A',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 150,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText:
              "Please briefly describe your question or the issue you're facing",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: KprimaryTextColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: KSecondaryTextColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: KprimaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({String title, bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? KMainColor : Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? KMainColor : Colors.grey),
          ),
        ],
      ),
    );
  }
}

emailFeedbackForm() {
  return Container(
    height: 50,
    child: Stack(
      children: [
        TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Please enter your e-mail",
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: KprimaryTextColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: KSecondaryTextColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: KSecondaryTextColor,
                ),
              ),
            ),
            padding: EdgeInsets.all(8.0),
          ),
        )
      ],
    ),
  );
}
