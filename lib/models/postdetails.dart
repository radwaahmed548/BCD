import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class Post{
  final String id;
  final String title;
  final String date;
  final String description;
  final String imageUrl;
  bool isFav;

  Post({
   @required this.id,
   @required this.title,
    @required  this.description,
    @required this.imageUrl,
     this.date,
    this.isFav
});
}
