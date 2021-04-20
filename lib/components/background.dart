import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(

      width: double.infinity,
      height: size.height,
      child: Stack(

        children: <Widget>[

          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "images/top-11.png",
                width: size.width
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "images/top2.png",
                width: size.width
            ),
          ),

          Positioned(
            bottom:0,
            right: 0,

            child: Image.asset(
                "images/bottom-11.png",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "images/bottom-2.png",
                width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}