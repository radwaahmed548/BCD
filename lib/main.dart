import 'package:flutter/material.dart';
import 'package:gp/machine%20learning%20model/Result2.dart';
import 'package:gp/screens/calendar_patient.dart';
import 'package:gp/screens/calendar_screen.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'screens/examination/examination_video_screen.dart';
import 'package:gp/machine learning model/Questions.dart';
import 'package:gp/machine learning model/Result1.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => WelcomeScreen(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegisterScreen(),
        '/home' : (context) => homescreen(),
        '/examination' : (context) => ExaminationScreen(),
        '/calendar' : (context) => CalendarScreen(),
        StartYourTrip.routeName : (context) => StartYourTrip(),
        '/patient-calendar' : (context) => CalendarPatient(),
        '/questions' : (context) => MyAppi(),
        '/result1' : (context) => ResultTrue(),
        '/result2' : (context) => ResultFalse(),

      },
    );
  }
}
