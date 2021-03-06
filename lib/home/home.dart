import 'package:flutter/material.dart';
import 'package:gp/models/login_auth.dart';

import 'package:provider/provider.dart';
import '../screens/login.dart';
import '../screens/register.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/home/data.dart';
import 'package:gp/components/tools.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}



class _homescreenState extends State<homescreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isInit = true;
  bool _isLoading;

  @override
  void didChangeDependencies() async {
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false).getUserData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldkey,
      drawer: MainDrawer(),

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [KSecondColor, Kgradintstartcolor],
                begin: Alignment.topCenter,
                
                end: Alignment.bottomCenter,
                stops: [0.2, 0.7]),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned
                (top: 30,
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



                      ],
                    ),
                  ),
                  Container(
                      height: size.height * 0.80,
                    padding: const EdgeInsets.only(left: 10, bottom:10),

                    child: Swiper(
                      itemCount: 2,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 50,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(

                        builder:
                        DotSwiperPaginationBuilder(activeSize: 30, activeColor: KSecondColor,space: 0,color:KSecondColor),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(

                          child: Stack(
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.150,),
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

                                          SizedBox(height: 70),
                                          Text(
                                            menue[index].name,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 30,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            menue[index].description,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 20,
                                              color: KprimaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: (){
                                                  //print(widget.user);
                                                  Navigator.pushNamed(context, menue[index].action);
                                                }
                                                ,child: Text(
                                                  'Know more',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 18,
                                                    color: KSecondaryTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
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
                                left: 70
                                ,child: CircleAvatar(
                                  radius: 85,
                                  backgroundColor: Kgradintstartcolor
                                  ,child: Image( image: AssetImage(menue[index].image),width: 100,)),
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








