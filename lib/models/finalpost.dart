import 'package:gp/models/postdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

 class Posts with ChangeNotifier {
   static List <Post> loadedpost =[

  // Post(id: 'p1',
  //   title: 'Caitlyn',
  //   date: "Mon May 3 2021 17:24",
  //   description: 'Together We Can ❤',
  //   imageUrl: 'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
  // ),
  // Post(id: 'p2',
  //   title: 'Jessy',
  //   date: "Mon May 3 2021 19:24",
  //   description: 'with cancer survivor',
  //   imageUrl: 'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
  // ),
  // Post(id: 'p3',
  //   title: 'emmy',
  //   date: "Mon May 2 2021 19:24",
  //   description: 'you are a fighter don not give up',
  //   imageUrl:'https://thumbs.dreamstime.com/z/support-breast-cancer-sufferers-pink-ribbon-quote-support-breast-cancer-sufferers-pink-ribbon-quote-146076145.jpg',
  // ),

];



   final String authToken;
   final String userID;
   Posts(this.authToken, this.userID);


Future<void> fetchAndsetpost () async {
  final url = Uri.parse(
      'https://bcd-gp-default-rtdb.firebaseio.com/posts.json?auth=$authToken');
  try {
    final response = await http.get(url);
    final extracteddata=json.decode(response.body) as Map<String,dynamic>;
    final List <Post> loadedposts =[];
    extracteddata.forEach((postid, postdata) {
      loadedposts.add(Post(
        id: postid,
        title: postdata['title'],
        description: postdata['description'],
        imageUrl: postdata['imageUrl'],
      ));
    });
    loadedpost = loadedposts;
   notifyListeners();
  } catch (error) {
    throw(error);
  }

}


Future <void> addpost(Post postt) async {
  final url = Uri.parse(
      'https://bcd-gp-default-rtdb.firebaseio.com/posts.json?auth=$authToken');
  try {
    final response = await http.post(
      url ,
        body:json.encode (
            {'title': postt.title,
              'description': postt.description,
              'imageUrl': postt.imageUrl,
              'isfav': postt.isFav,
            }
        ));
    notifyListeners();
  } catch(e) {
    throw(e);
  }




  final newpost=Post(
      id: DateTime.now().toString(),
      title: postt.title,
      description: postt.description,
      imageUrl: postt.imageUrl);

  loadedpost.add(newpost);
  notifyListeners();
}
}
