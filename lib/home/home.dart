import 'package:flutter/material.dart';
import '../screens/login.dart';
import '../screens/register.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/home/constants.dart';
import 'package:gp/home/data.dart';
import 'package:gp/components/tools.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: MainDrawer(),
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [KSecondColor, Kgradintstartcolor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.7])),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned
                (top: 40,
                child: IconButton(icon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.menu,color:Colors.white,),
                ),
                    onPressed: () { _scaffoldkey.currentState.openDrawer();}
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[

                        Center(
                          child: Text(
                            'Explore',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 44,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    height: 600,
                    padding: const EdgeInsets.only(left: 10),

                    child: Swiper(
                      itemCount: 2,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 50,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(

                        builder:
                        DotSwiperPaginationBuilder(activeSize: 30, activeColor: KMainColor,space: 0,color:KMainColor),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Stack(
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  SizedBox(height: 130),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[

                                          SizedBox(height: 50),
                                          Text(
                                            planets[index].name,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 30,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            planets[index].description,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 20,
                                              color: KprimaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 32),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Know more',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: KSecondaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: KSecondaryTextColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
left: 40
                                ,child: CircleAvatar(
                                  radius: 85,
                                  backgroundColor: Kgradintstartcolor
                                  ,child: Image( image: AssetImage(planets[index].image),width: 100,)),
                              ),



                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}








