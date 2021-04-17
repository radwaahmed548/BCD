import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';

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
     body:Background(
       child: Stack(

         children:<Widget> [
           Positioned
             (top: 40,
             child: IconButton(icon: Icon(Icons.menu,color: KMainColor,),
                 onPressed: () { _scaffoldkey.currentState.openDrawer();}
             ),
           ),

         ],
       ),
     ) ,


    );
  }
}
