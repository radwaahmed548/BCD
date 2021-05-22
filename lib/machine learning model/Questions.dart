import 'dart:ui';
import 'package:gp/components/tools.dart';
import 'package:flutter/material.dart';
import 'package:gp/machine learning model/Result1.dart';
import 'package:gp/machine learning model/Result2.dart';


class MyAppi extends StatefulWidget {
  @override
  _MyAppiState createState() => _MyAppiState();
}

class _MyAppiState extends State<MyAppi> {
  double extent = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: KSecondaryTextColor,
      body: body(),
    );
  }

  Widget body() {

    double extent = 0;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [

        Positioned(
          child: Image.asset(
              "images/questions.jpg",
              width: size.width
          ),
        ),


        SizedBox.expand(


          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder:
                (BuildContext context, ScrollController scrollController) {
              Size size = MediaQuery.of(context).size;

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(extent == 1.0 ? 0 : 16),
                    topRight: Radius.circular(extent == 1.0 ? 0 : 16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: KMainColor,
                      offset: Offset(-1, -1),
                    )
                  ],
                  color: Kgradintstartcolor,
                ),
                child: Column(
                  children: [
                    Visibility(
                      visible: extent != 1.0,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: KSecondColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Medical Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: KMainColor,
                                  fontSize: 30,
                                  fontFamily: "Raleway"
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          SizedBox(height: size.height * 0.01),

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Answer these questions",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: KMainColor,
                                  fontSize: 18,
                                  fontFamily: "Raleway"
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),


                          SizedBox(
                            height: size.height * 0.03,
                            width: size.width *0.03,
                            child: Divider(
                              thickness: 1.5,
                              indent: 50.0,
                              endIndent: 50.0,
                              color: KSecondColor,
                            ),
                          ),



                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Radius",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Texture",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Fractal Dimension",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Smoothness",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),


                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Compactness",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),




                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Area",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Concavity",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Symmetry",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Perimeter",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Concave Point",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Mean Feactal Dimension",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Radius Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Texture Error",
                                filled: true,
                                fillColor:  Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Perimeter Error",
                                filled: true,
                                fillColor:  Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Smoothness Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Area Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Concavity Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Symmetry Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Perimeter",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Concave Point Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Feactal Dimension Error",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Texture",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Radius",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Fractal Dimension",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Smoothness",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Compactness",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),







                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Area",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Concavity",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Symmetry",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Perimeter",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:KSecondaryTextColor),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                labelText: "Worst Concave Point",
                                filled: true,
                                fillColor: Kgradintstartcolor,
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/result2');
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
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Robotomono"
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}