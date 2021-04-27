import 'package:flutter/material.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class StartYourTrip extends StatefulWidget {
  static const routeName = '/trip-screen';

  @override
  _StartYourTripState createState() => _StartYourTripState();
}

class _StartYourTripState extends State<StartYourTrip> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  List<DateTime> _pickedDate1;
  List<DateTime> _pickedDate2;
  List<DateTime> _pickedDate3;

  void _datePickerButton() {
    MaterialButton(
        color: Colors.deepOrangeAccent,
        onPressed: () async {
          final List<DateTime> picked = await DateRangePicker.showDatePicker(
              context: context,
              initialFirstDate: new DateTime.now(),
              initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
              firstDate: new DateTime(2015),
              lastDate: new DateTime(DateTime.now().year + 2));
          if (picked != null && picked.length == 2) {
            print(picked);
          }
        },
        child: new Text("Pick date range"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kgradintstartcolor,
      key: _drawerKey,
      drawer: MainDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(Icons.menu, color: KSecondColor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    child: Center(
                      child: Text(
                        'Start Your Trip',
                        style: TextStyle(
                          color: KSecondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KSecondColor),
                      ),
                      hintText: 'First Step',
                    ),
                    onSubmitted: (_) {},
                  ),
                  _pickedDate1 == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Center(
                                    child: Text(
                                      'No Date Chosen',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate1 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(DateFormat.MMMd()
                                        .format(_pickedDate1[0]), style: TextStyle(color: Colors.white),),
                                    Text('  -  ', style: TextStyle(color: Colors.white)),
                                    Text(DateFormat.MMMd()
                                        .format(_pickedDate1[1]), style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.calendar_today, color: Colors.white,),
                                  ],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate1 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                  Divider(color: KSecondColor,),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KSecondColor),
                      ),
                      hintText: 'Second Step',
                    ),
                    onSubmitted: (_) {},
                  ),
                  _pickedDate2 == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Center(
                                    child: Text(
                                  'No Date Chosen',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate2 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(DateFormat.MMMd()
                                            .format(_pickedDate2[0]), style: TextStyle(color: Colors.white),),
                                    Text('  -  ', style: TextStyle(color: Colors.white)),
                                    Text(DateFormat.MMMd()
                                            .format(_pickedDate2[1]), style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.calendar_today, color: Colors.white,),
                                  ],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate2 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                  Divider(color: KSecondColor,),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KSecondColor),
                      ),
                      fillColor: KSecondColor,
                      hintText: 'Third Step',
                    ),
                    onSubmitted: (_) {},
                  ),
                  _pickedDate3 == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Center(
                                    child: Text(
                                      'No Date Chosen',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate3 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 150,
                                height: 40,
                                color: KSecondaryTextColor,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(DateFormat.MMMd()
                                            .format(_pickedDate3[0]), style: TextStyle(color: Colors.white),),
                                    Text('  -  ', style: TextStyle(color: Colors.white),),
                                    Text(DateFormat.MMMd()
                                            .format(_pickedDate3[1]), style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.calendar_today, color: Colors.white,),
                                  ],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            FlatButton(
                              onPressed: () async {
                                final List<DateTime> picked =
                                    await DateRangePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(
                                            DateTime.now().year + 2));
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                  setState(() {
                                    _pickedDate3 = picked;
                                  });
                                }
                              },
                              child: Text(
                                'Choose Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                  Row(
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
                              onPressed: () => Navigator.of(context).pushNamed('/patient-calendar'),
                              child: FittedBox(
                                child: Text(
                                    'Create Calendar',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),

                              ),
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
