import 'package:flutter/material.dart';
import '../screens/login.dart';
import '../screens/register.dart';
import 'package:gp/components/background.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/home/data.dart';
import 'package:gp/components/tools.dart';

import '../components/tools.dart';
import '../components/tools.dart';


class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}



class _StoriesState extends State<Stories> {

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: KSecondColor,
          title: Text("Stories"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){}  ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: IconButton(icon :Icon(Icons.chat),onPressed: (){
                Navigator.pushNamed(context, '/Community');},),),
              Tab(icon: IconButton(icon :Icon(Icons.people),onPressed: (){
                Navigator.pushNamed(context, '/Stories');},),),
              Tab(icon: IconButton(icon :Icon(Icons.bookmark_sharp),onPressed: (){
                Navigator.pushNamed(context, '/SavedPosts');},),),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(top: 60,
                child: IconButton(icon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.menu,color:KMainColor
                    ,),
                ),
                    onPressed: () { _scaffoldkey.currentState.openDrawer();}
                ),
              ),
              Column(
                children: [
                  Card(
                    child: Container(
                      height: 350.0,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("images/Avatar1.jpg") ,
                            ),
                            title: Text("Caitlyn",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:FontWeight.bold
                              ),
                            ),
                            subtitle: Text("Mon May 3 2021 17:24"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text("Together We Can ❤",
                                style: TextStyle(fontSize: 20,color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/Post1.jpg")
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.favorite),color: Colors.blue,),
                              Text("like",
                                style: TextStyle(color: Colors.grey ),),

                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.chat),color: Colors.grey,),
                              Text("Comment",
                                style: TextStyle(color: Colors.grey ),),

                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.star),color: Colors.yellowAccent,),
                              Text("Favorite",
                                style: TextStyle(color: Colors.grey ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 350.0,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("images/Avatar2.jfif") ,
                            ),
                            title: Text("Jessy",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:FontWeight.bold
                              ),
                            ),
                            subtitle: Text("Mon May 3 2021 17:24"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text("With Cancer Survivors ✌️",
                                style: TextStyle(fontSize: 20,color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/Post2.jpg")
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.favorite),color: Colors.grey,),
                              Text("like",
                                style: TextStyle(color: Colors.grey ),),

                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.chat),color: Colors.grey,),
                              Text("Comment",
                                style: TextStyle(color: Colors.grey ),),

                              Padding(
                                padding: EdgeInsets.only(right: 20),
                              ),

                              Icon((Icons.star),color: Colors.grey,),
                              Text("Favorite",
                                style: TextStyle(color: Colors.grey ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),


            ],
          ),
        ),

      ),
    );
  }
}
