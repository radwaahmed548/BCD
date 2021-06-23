import 'package:flutter/material.dart';
import 'package:gp/models/postdetails.dart';
import 'posts.dart';
import 'package:gp/models/finalpost.dart';
import 'package:provider/provider.dart';
import 'package:gp/screens/post/add_post.dart';

class postgrid extends StatelessWidget {
  final bool showFavs;

  postgrid(this.showFavs);
 // List <Post> postList =Posts.loadedpost;

  @override
  Widget build(BuildContext context) {
    final postdata = Provider.of<Posts>(context);
    final posts = showFavs ? postdata.favoriteItems : Posts.loadedpost;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount:posts.length,

        itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
          value:posts[i],
          child: Postoverview(
            //postList[i].id,
           // postList[i].title,
           // postList[i].imageUrl,
            //postList[i].description,


          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,crossAxisSpacing: 20
        ));
  }
}
