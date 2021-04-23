import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class Utility {
  static Widget imageLoader(String url, String placeholder,
      {BoxFit fit = BoxFit.cover}) {
    return (url == "null" || url == null || url.trim() == "")
        ? Image.asset(placeholder)
        : CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }


  static Widget progress(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor:Colors.white.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}
