import 'package:gp/models/postdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';

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


   List <Post> get loadedposts{
     return [...loadedposts];
   }

   final String authToken;
   final String userID;
   Posts( this.authToken, this.userID);

  Post findById(String id) {
    return loadedpost.firstWhere((prod) => prod.id == id);
  }

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
  Future <void> DeletePost(String id) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/posts/$id.json?auth=$authToken');
    final existingPostIndex = loadedpost.indexWhere((prod) => prod.id == id);
    var existingPost = loadedpost[existingPostIndex];
    loadedpost.removeAt(existingPostIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      loadedpost.insert(existingPostIndex, existingPost);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingPost = null;
  }
  Future<void> updatePost(String id, Post newPost) async {
    final prodIndex = loadedpost.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://bcd-gp-default-rtdb.firebaseio.com/posts/$id.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': newPost.title,
            'description': newPost.description,
            'imageUrl': newPost.imageUrl,

          }));
      loadedpost[prodIndex] = newPost;
      notifyListeners();
    } else {
      print('...');
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
