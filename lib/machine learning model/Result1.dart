import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';

class ResultTrue extends StatelessWidget {

  Tween <double> _scaleTween = Tween<double>(begin: 1,end: 2);

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Kgradintstartcolor,
      body: Center(

        child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              SizedBox(height: size.height * 0.03),

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
                      "images/NoOneFightsAlone.jpg",
                    ),
                  ),

                ),
              ),

              SizedBox(height: size.height * 0.03),


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
                            color: KMainColor,
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
                padding: const EdgeInsets.all(16),
                child: Container(
                  alignment: Alignment.centerRight,
                  //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
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
                        "Set your Calender",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Robotomono"
                        ),
                      ),
                    ),
                  ),
                ),
              ),




            ]
        ),
      ),
    );
  }
}

