import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/models/postdetails.dart';
import 'package:gp/screens/post/postgrid.dart';
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
import 'postgrid.dart';




enum FilterOptions {
  Favorites,
  All,
}

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();


}

class _CommunityState extends State<Community> {
  var _isInit = true;
  var _isloading= false;
  var _showOnlyFavorites = false;




  Future<void> _refreshPosts(BuildContext context) async {
    await Provider.of<Posts>(context,listen: false).fetchAndsetpost();
  }

 // List <Post> postList =Posts.loadedpost;

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


    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: Text("NewsFeed"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),

        ],

      ),

      body:
      RefreshIndicator(
        onRefresh: () => _refreshPosts(context),
        child: _isloading ? Center( child: CircularProgressIndicator(),
        )

        :postgrid(_showOnlyFavorites),
      ),



      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/addpost');
      },
        child: Icon(Icons.edit),
        backgroundColor: KMainColor,),
    );
  }
}



