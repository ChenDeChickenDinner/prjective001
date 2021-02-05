import 'package:flutter/material.dart';
import 'package:flutter_app1/work1/webView.dart';

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
      child: GestureDetector(
        onTap: (){
          print(dict["jumpUrl"]);
          Navigator.push(context, MaterialPageRoute(
              settings: RouteSettings(),
              maintainState: true,
              // fullscreenDialog: true,
              builder: (context){
                return webViewWidget(url: dict["jumpUrl"],);
              }
          ));
        },
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
      )
    );
  }
}