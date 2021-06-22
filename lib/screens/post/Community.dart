import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/models/postdetails.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
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
import 'package:gp/components/maindrawer.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  var _isInit = true;
  var _isloading= false;

  List <Post> postList =Posts.loadedpost;

  @override
 void initState(){
  //  Provider.of<Posts>(context,listen:false).fetchAndsetpost();
    super.initState();
  }
  @override
  void didChangeDependencies(){
    if(_isInit){
      setState(() {
        _isloading=true;
      });
      Provider.of<Posts>(context,listen:false).fetchAndsetpost().then((_){
       setState(() {
         _isloading=false;
       });
      });
    }
_isInit=false;
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
 final postdata = Provider.of<Posts>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: Text("NewsFeed"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}  ),
        ],

      ),

      body:_isloading ? Center( child: CircularProgressIndicator(),
      )

      :GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount:postList.length,

        itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
          value:postList[i],
          child: Postoverview(
            postList[i].id,
             postList[i].title,
              postList[i].imageUrl,
            postList[i].description,

          ),
        ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,crossAxisSpacing: 20
        )),



      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/addpost');
      },
        child: Icon(Icons.edit),
        backgroundColor: KMainColor,),
    );
  }
}



