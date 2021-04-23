import 'package:flutter/material.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CalendarPatient extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Scaffold(
        key: _drawerKey,
        drawer: MainDrawer(),
        body: SafeArea(
          child: Stack(children: [
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                height: 550,
                decoration: BoxDecoration(
                  color: KSecondColor,
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(Icons.menu),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                TableCalendar(
                  calendarController: _controller,
                  headerVisible: false,
                  calendarStyle: CalendarStyle(
                      selectedColor: KSecondaryTextColor,
                      outsideStyle: TextStyle(
                        color: KprimaryTextColor,
                      ),
                      weekdayStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StartYourTrip.routeName);
                        },
                        child: Text(
                          'Check',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        color: KSecondColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ]),
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

