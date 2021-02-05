


import 'dart:io';

import 'package:flutter/material.dart';


void main(){

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: myRoundImage(),
    ),
  ));
}

class myImageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var image1 = AssetImage("assetName");
    var image2 = FileImage(File("file"));
    var image3 = NetworkImage("url");

    return Container();
  }
}

class MyImage extends StatelessWidget {
  final String  url = "https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Image(

        /*width、height：
          0.Image Widget 是显示image的一个载体，一个组件。Image Widget跟image是两个概念，各有各的宽高区域
          1.用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，
          2.如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则
          */
        width: 200,
        height: 200,
        // fit: BoxFit.contain, (包含)不变形,图片>容器：按照比例缩放后居中，(容器包含图片)：一个方向会留空白《默认》
        // fit: BoxFit.cover,  (覆盖)不变形,图片>容器：按照比例缩放后居中，(图片覆盖容器)：超出空间部分会被剪裁
        // fit: BoxFit.none,(none)不变形,图片>容器：不缩放，只显示容器那么大的区域


        alignment: Alignment.center, //对齐方式,默认
        repeat: ImageRepeat.noRepeat, //重复方式,默认
        image:NetworkImage(
          url,
          scale: 1, // 图片显示 宽高 = 图片原图宽高/scale
        ),

        frameBuilder: (  BuildContext context,
            Widget child,
            int frame,
            bool wasSynchronouslyLoaded){
          return Text("frameBuilder");
        },
        loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent loadingProgress){
          return Text("loadingBuilder");
        },
        errorBuilder: (
            BuildContext context,
            Object error,
            StackTrace stackTrace){
          return Text("errorBuilder");
        },

      ),
    );
  }
}

class fastImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("name"),
          Image.network("src"),
          Image.file(File("file")),
        ],
      ),
    );
  }
}


/* 占位图*/
class myFadeInImage extends StatelessWidget {
  final String  placeholderUrl = "https://t7.baidu.com/it/u=3655946603,4193416998&fm=193&f=GIFF";
  final String  imageUrl = "https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black45,
        child:FadeInImage(
            placeholder: NetworkImage(placeholderUrl),
            image: NetworkImage(imageUrl)
        )
    );
  }
}
/* 圆角图片
Image 是不支持圆角和阴影的，目前可以通过使用 CircleAvatar 和 Container 实现。
* */
class myRoundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        CircleAvatar(
          child: Image.network(
              "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
//                backgroundColor: Color(0xffff0000),
//              backgroundImage: NetworkImage(
//                  "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
          radius: 40.0,
//              foregroundColor: Color(0x55000000),
        ),
        Align(
          child: CircleAvatar(
            child: Image.network(
                "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
//                backgroundImage: new NetworkImage(
//                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
            backgroundColor: Color(0xffff0000),
            radius: 40.0,
          ),
        ),
        //圆行图片
        Align(
          child: CircleAvatar(
//                child: Image.network(
//                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
            backgroundImage: NetworkImage(
                "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
            backgroundColor: Color(0xffff0000),
            radius: 40.0,
          ),
        ),
        Align(
          child: CircleAvatar(
//                child: Image.network(
//                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
            backgroundImage: NetworkImage(
                "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"),
            foregroundColor: Color(0xffff0000),
            radius: 40.0,
          ),
        ),
        Align(
          child: ClipOval(
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: Image.network(
                "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                fit: BoxFit.fill,),
            ),
          ),
        ),
        Align(
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                  ),
                ),
              ),
            )
        ),
        //圆角图片
        Align(
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 80.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}