import 'package:flutter/material.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPatient extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),
      body: Background(
        child: SafeArea(
          child: Stack(children: [
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
                TableCalendar(
                  calendarController: _controller,
                  calendarStyle: CalendarStyle(selectedColor: KSecondColor,),
                ),
                FlatButton(
                  onPressed: () {},
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

          ]),
        ),
      ),
    );
  }
}
