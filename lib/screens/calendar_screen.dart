import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/models/cal_normal.dart';
import 'package:gp/models/login_auth.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../components/tools.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  CalendarController _controller = CalendarController();
  bool _isLoading;
  bool _isInit = true;

  @override
  void initState() {
    initializeSetting();
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CalNormal>(context, listen: false).fetchData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<CalNormal>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final calendarDate = Provider.of<CalNormal>(context);
    //final currentDate = calendarDate.currentDate;
    var calendar = CalendarNormal(
      id: null,
      dateOfExam: DateTime.now(),
    );
    //final patientID = Provider.of<Auth>(context).userID;
    final dateId = Provider.of<CalNormal>(context, listen: false).dateID;
    //final dateIndex = Provider.of<CalNormal>(context, listen: false).findById(dateId);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
        onRefresh: () => _refreshData(context),
        child: Stack(children: [
                ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: size.height * 0.75,
                    decoration: BoxDecoration(color: Kgradintstartcolor),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: IconButton(
                    onPressed: () => _drawerKey.currentState.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: KMainColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(),
                    TableCalendar(
                      calendarController: _controller,
                      //events: {currentDate[dateIndex].dateOfExam.add(Duration(days: 5)): ['Day Of Examination']},
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              width: 100,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                  color: KMainColor),
                              padding: const EdgeInsets.all(0),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Calender Updated"),
                                            content:
                                                Text("In 30 days We are Going to Inform You"),
                                          ));
                                  calendar = CalendarNormal(
                                    dateOfExam: _controller.selectedDay,
                                  );
                                  if(dateId != null)
                                    {
                                      Provider.of<CalNormal>(context, listen: false)
                                          .updateDate(dateId ,calendar);
                                      _refreshData(context);
                                    } else {
                                    Provider.of<CalNormal>(context, listen: false)
                                        .addCalendar(calendar);
                                    _refreshData(context);
                                  }
                                  displayNotification(
                                      'Your Next Examination Day is Tmw!',
                                      DateTime.now().add(Duration(seconds: 5)));
                                },
                                child: FittedBox(
                                  child: Text('Save Calendar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
                    ),
      ));
          }
  }

Future<void> displayNotification(String data, DateTime dateTime) async {
  notificationsPlugin.zonedSchedule(
      0,
      data,
      'Reminder!',
      tz.TZDateTime.from(dateTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
            'channel id', 'channel name', 'channel description'),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true);
}

void initializeSetting() async {
  var initializeAndroid = AndroidInitializationSettings('bcd_not');
  var initializeSetting = InitializationSettings(android: initializeAndroid);
  await notificationsPlugin.initialize(initializeSetting);
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
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogcontent(context),
    );
  }

  dialogcontent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
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
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Confirm", style: TextStyle(color: KMainColor)),
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
                backgroundImage: NetworkImage(
                    "https://media.giphy.com/media/3iCmWogzAsTtO1N43K/giphy.gif"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
