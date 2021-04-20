import 'package:flutter/material.dart';
import 'package:gp/screens/calendar_screen.dart';
import './screens/examination_video_screen.dart';
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
      },
    );
  }
}
