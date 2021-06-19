import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';


class Postoverview extends StatelessWidget {
  final String id;
  final String title;
final String description;
  final String imageUrl;

  Postoverview(this.id,this.title,this.description,this.imageUrl);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect
        (
        borderRadius: BorderRadius.circular(10),
        child: GridTile(

header:Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
         child: Image.network(imageUrl),
          footer: GridTileBar(
            backgroundColor: Colors.black38,
            subtitle:Text(description,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 20),),
            trailing: IconButton(icon:Icon( Icons.favorite),),

          ),

        ),
      ),


    );


  }
}
