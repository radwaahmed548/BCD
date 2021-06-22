//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:provider/provider.dart';
import 'package:gp/models/finalpost.dart';
import 'add_post.dart';


class Postoverview extends StatelessWidget {
  final String id;
  final String title;
final String description;
  final String imageUrl;

  Postoverview(this.id,this.title,this.description,this.imageUrl);





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final post = Provider.of<Post>(context, listen: false);
    final scaffold = Scaffold.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(clipBehavior: Clip.antiAlias,
          elevation: 18,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.network(post.imageUrl,
                fit: BoxFit.fill,
               // width: double.infinity,
                 height: size.height * 0.25,),
    ExpansionTile(
        childrenPadding:EdgeInsets.all(8).copyWith(top: 0),
            title:Text(post.title, textAlign: TextAlign.left,),
            children: [Text(post.description,textAlign: TextAlign.left ,style: TextStyle(color: Colors.black54,fontSize: 20)),
                 ],),

                ButtonBar(
                  children: [
                    IconButton(icon: Icon(Icons.favorite), color: Theme.of(context).errorColor,),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {

                        Navigator.pushNamed(context, '/addpost',arguments: id);
                      },
                      color: Theme.of(context).errorColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        try {
                          await Provider.of<Posts>(context, listen: false).
                          DeletePost(id);
                        } catch (error) {
                          scaffold.showSnackBar(
                            SnackBar(
                              content: Text('Deleting failed!', textAlign: TextAlign.center,),
                            ),
                          );
                        }
                      },
                      color: Theme.of(context).errorColor,
                    ),
                  ],
                )

              ],
            ),
          ),

        ),
      )


    );


  }
}
