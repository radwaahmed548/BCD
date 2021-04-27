import 'package:flutter/material.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/screens/calendar_patient.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/tools.dart';
import '../components/tools.dart';

class CalendarScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),
      body: Stack(children: [
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            height: 550,
            decoration: BoxDecoration(
              color: Kgradintstartcolor
            ),
          ),
        ),
        Positioned(
          top: 60,
          child: IconButton(
            onPressed: () => _drawerKey.currentState.openDrawer(),
            icon: Icon(Icons.menu,color: KMainColor,),
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
                  selectedColor: KMainColor,
                  outsideStyle: TextStyle(
                    color: KMainColor,
                  ),
                  weekdayStyle: TextStyle(
                    color: Colors.black,
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
                  Container(

                    alignment: Alignment.center,
                    height: 50.0,
                    width:  130,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: KMainColor
                    ),
                    padding: const EdgeInsets.all(0),
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pushNamed('/trip-screen'),
                      child: FittedBox(
                        child: Text(
                            'update',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Robotomono',
                            )),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
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
