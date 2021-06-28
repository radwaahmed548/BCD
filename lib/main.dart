import 'package:flutter/material.dart';
import 'package:gp/machine%20learning%20model/Result2.dart';
import 'package:gp/models/cal_normal.dart';
import 'package:gp/models/cal_patient.dart';
import 'package:gp/models/login_auth.dart';
import 'package:gp/screens/calendar_patient.dart';
import 'package:gp/screens/calendar_screen.dart';
import 'package:gp/screens/start_your_trip.dart';
import 'package:provider/provider.dart';
import 'screens/examination/examination_video_screen.dart';
import 'package:gp/machine learning model/Questions.dart';
import 'package:gp/machine learning model/Result1.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'home/home.dart';
import 'screens/post/Community.dart';

import 'models/finalpost.dart';
import 'screens/Stories.dart';
import 'screens/profile.dart';
import 'screens/HelpCenter.dart';
import 'models/login_auth.dart';
import 'screens/SplashScreen.dart';
import 'package:gp/screens/post/add_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, CalPatient>(
          update: (ctx, auth, prevData) => CalPatient(
              auth.token,
              auth.userID
          ),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, CalNormal>(
          update: (ctx, auth, prevData) => CalNormal(
            auth.token,
            auth.userID
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Posts>(
          update: (ctx, auth, prevData) => Posts(

              auth.token,
              auth.userID
          ),
        ),


      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Flutter Login',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFF2661FA),
            scaffoldBackgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: auth.isAuth
              ? homescreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : LoginScreen(),
                ),
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => homescreen(),
            '/examination': (context) => ExaminationScreen(),
            '/calendar': (context) => CalendarScreen(),
            StartYourTrip.routeName: (context) => StartYourTrip(),
            '/patient-calendar': (context) => CalendarPatient(),
            '/questions': (context) => MyAppi(),
            '/result1': (context) => ResultTrue(),
            '/result2': (context) => ResultFalse(),
            '/Community': (context) => Community(),
            '/addpost' :(context) => addpost(),
            '/Stories': (context) => Stories(),
            '/profile': (context) => ProfileScreen(),
            '/helpcenter': (context) => HelpCenter(),
            '/addpostscreen' :(context) => addpost(),
          },
        ),
      ),
    );
  }
}
