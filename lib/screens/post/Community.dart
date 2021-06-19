import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/models/postdetails.dart';
import 'package:http/http.dart';
import '../login.dart';
import '../register.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/home/data.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/models/postdetails.dart';
import '../../components/tools.dart';
import '../../components/tools.dart';
import 'add_post.dart';
import 'posts.dart';
import 'add_post.dart';
import 'package:http/http.dart' as http;
import 'package:gp/models/finalpost.dart' ;
import 'package:gp/models/postdetails.dart';

class Community extends StatelessWidget {
  List <Post> postList = Posts.loadedpost;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: Text("NewsFeed"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}  ),
        ],

      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount:postList.length,

        itemBuilder: (ctx,i) => Postoverview(
          postList[i].id,
            postList[i].title,
            postList[i].imageUrl,
          postList[i].description,

        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,childAspectRatio: 2/1, mainAxisSpacing: 10
        ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/addpost');
      },
        child: Icon(Icons.edit),
        backgroundColor: KMainColor,),
    );
  }
}



