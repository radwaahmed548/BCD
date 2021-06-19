import 'package:flutter/material.dart';
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

class Community extends StatelessWidget {


  final List<Post> loadedpost =[

    Post(id: 'p1',
        title: 'Caitlyn',
        date: "Mon May 3 2021 17:24",
        description: 'Together We Can ❤',
        imageUrl: 'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
    ),
    Post(id: 'p2',
        title: 'Jessy',
        date: "Mon May 3 2021 19:24",
        description: 'with cancer survivor',
        imageUrl: 'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
    ),
    Post(id: 'p3',
        title: 'emmy',
        date: "Mon May 2 2021 19:24",
        description: 'you are a fighter don not give up',
       imageUrl:'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
    ),

  ];
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
        itemCount: loadedpost.length,
        itemBuilder: (ctx,i) => Postoverview(
            loadedpost[i].id,
            loadedpost[i].title,
            loadedpost[i].imageUrl,
          loadedpost[i].description,

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
