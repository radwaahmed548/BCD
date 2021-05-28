import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';

class ResultFalse extends StatelessWidget {

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
                    width: 175,
                    height: 175,
                    child: Image.asset(
                      "images/hope-lettering.jpg",
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
                    child: Text(
                      "CONGRATULATIONS, YOU HAVE A GOOD HEALTH!!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KMainColor,
                          fontSize: 23,
                          fontFamily: "Courgette-Regular"
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                          "The practice of a woman to get to know her own breasts and as such to be able to detect any changes rapidly. Breast Self Examination (BSE) remains an effective method to raise “Breast Awareness”. \n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: "Raleway"
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
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
                        "Self Examination",
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
