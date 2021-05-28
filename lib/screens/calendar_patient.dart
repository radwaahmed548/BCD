import 'package:flutter/material.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/screens/calendar_patient.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/tools.dart';
import '../components/tools.dart';

class CalendarPatient extends StatelessWidget {
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
                    width:  100,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: KMainColor
                    ),
                    padding: const EdgeInsets.all(0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Community');},
                      child: FittedBox(
                        child: Text(
                            'Community',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Robotomono',
                            )),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      alignment: Alignment.center,
                      height: 50.0,
                      width:  130,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: KMainColor
                      ),
                      padding: const EdgeInsets.all(0),
                      child: FlatButton(
                        onPressed: (){
                          showDialog(context: context, builder: (context) => CustomDialog(
                            title: "Calender Updated",
                            description: "In 30 days We are Going to Inform You",
                          ));
                        },
                        child: Column(
                          children: [
                            FittedBox(
                              child: Text(
                                  'update',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: 'Robotomono',
                                  )),
                            ),
                            IconButton(icon: Icon(Icons.chat), onPressed: (){Navigator.pushNamed(context, '/calendar');})
                          ],
                        ),
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


//Popup message
class CustomDialog extends StatelessWidget{
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title,this.description,this.buttonText,this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogcontent(context),
    );
  }
  dialogcontent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:  EdgeInsets.only(
              top: 100,
              bottom: 16,
              left: 16,
              right: 16
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow:  [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.0),
              Text(description,style: TextStyle(fontSize: 16.0),),
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Confirm", style:TextStyle(color: KMainColor)),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: Center(
            child: Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                backgroundImage: NetworkImage("https://media.giphy.com/media/3iCmWogzAsTtO1N43K/giphy.gif"),
              ),
            ),
          ),
        )
      ],
    );
  }
}