import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/components/maindrawer.dart';

class ResultTrue extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  Tween <double> _scaleTween = Tween<double>(begin: 1,end: 2);

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),

      backgroundColor: Colors.white,
      body: Center(

        child: Stack(
          children: [
            Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  SizedBox(height: size.height * 0.05),

                  Container(

                    child: TweenAnimationBuilder(
                      tween: _scaleTween,
                      duration: Duration(milliseconds: 5000),
                      curve: Curves.bounceOut,
                      builder: (context, scale, child){
                        return Transform.scale(scale: scale , child: child);
                      },

                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          "images/4237408.jpg",
                        ),
                      ),

                    ),
                  ),

                  SizedBox(height: size.height * 0.007),


                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Text(
                            "UNFORTUNATELY, YOU HAVE BREAST CANCER.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF3581),
                                fontSize: 23,
                                fontFamily: "Courgette-Regular"
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),


                      ),

                      SizedBox(height: size.height * 0.03),


                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                              "Cancer may have started the fight, but you will finish it,\n"
                              "It is only going to be a chapter in your life, not the whole story.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey ,
                              fontSize: 18,
                              fontFamily: "Raleway"
                          ),
                          textAlign: TextAlign.left,
                        ),


                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30,right: 30),
                    child: Container(
                      alignment: Alignment.centerRight,
                      //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/trip-screen');
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              color: KMainColor
                          ),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "Start Your Trip",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),




                ]
            ),
            Positioned(
              top: 60,
              child: IconButton(
                onPressed: () => _drawerKey.currentState.openDrawer(),
                icon: Icon(Icons.menu,color: KMainColor,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

