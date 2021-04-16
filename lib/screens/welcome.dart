

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';

class WelcomeScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:[
         Column(children: <Widget>[
          Expanded(
            flex: 3,
              child: Opacity(
                opacity: .9,

                child: Container(
            decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage('images/basic.jpeg'),fit:BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54,BlendMode.darken)
                  )),
          ),
              )),

        ],),
          Positioned(top: 350,
            left: 9,
            child: Text('Hello Fighter..',
              style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold,),),


          ),
          Positioned(top: 400,
            left: 9,
            child: Text('we will be with you through your trip   ',


              style: TextStyle(color: Colors.white,fontSize: 15,),),


          ),
          SizedBox(height: 80,
          width: 100,),
          Positioned(
            top: size.height * 0.75,
              left: 40,
              child: Container(height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: KMainColor
          ),
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Sign up',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Courgette',color: Colors.white),
              ),
            ),
          )),
          Positioned(
              top: size.height * .85,
              left: 40,
              child: Container(height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: KMainColor
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Sign in',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Courgette',color: Colors.white),
                  ),
                ),
              ))


        ],

      ),
    );

  }
}
