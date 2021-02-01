import 'package:flutter/material.dart';


class MyItem extends StatelessWidget {
  final Map dict;
  final String imgUrl;
  final String title;
  final String jumpUrl;


  MyItem({this.dict,this.imgUrl,this.title,this.jumpUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(dict["imgUrl"]),
                  fit: BoxFit.cover,
                )
            ),
            width: 45,
            height: 45,
          ),
          Align(
            child: Text(dict["title"]),
          )
        ],
      ),
    );
  }
}