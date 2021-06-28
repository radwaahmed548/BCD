import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Post with ChangeNotifier{
  final String id;
  final String title;
  final String date;
  final String description;
  final String imageUrl;
  bool isFavorite;

  Post({
   @required this.id,
   @required this.title,
    @required  this.description,
    @required this.imageUrl,
     this.date,
    this.isFavorite=false,
});

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }
  Future<void> toggleFavoriteStatus(String token, String userId) async {

    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$token');
    try {
      final response = await http.put(
        url,
        body: json.encode(
           isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}
