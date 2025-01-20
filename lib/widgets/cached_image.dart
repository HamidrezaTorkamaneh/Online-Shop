import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String ?imageUrl;
  double radius;
  CachedImage({super.key,  this.imageUrl,this.radius=0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.red[100],
        ), imageUrl: imageUrl??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkqrp9xcrIPt3IuuO2J4imj8U9Tk5aRw-Ehw&s',
      ),
    );
  }
}
