

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: Center(
        child: myImageAndIcon(),
      ),
    ),
  ));

}

class myImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myFadeInImage();
  }
}

/*
在 Flutter 中也有多种方式，用来加载不同形式、支持不同格式的图片：
  加载本地资源图片，如 Image.asset(‘images/logo.png’)；
  加载本地（File 文件）图片，如 Image.file(new File(’/storage/xxx/xxx/test.jpg’))；
  加载网络图片，如 Image.network('http://xxx/xxx/test.gif') 。
除了可以根据图片的显示方式设置不同的图片源之外，
图片的构造方法还提供了填充模式 fit、拉伸模式 centerSlice、重复模式 repeat 等属性，
可以针对图片与目标区域的宽高比差异制定排版模式


width、height：
用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，
如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则

fit 设置图片的填充模式，具体由BoxFit实现
fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分

repeat：
当图片本身大小小于显示空间时，指定图片的重复规则
* */
class myImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*  ImageProvider
    1.ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，从不同的数据源获取图片需要实现不同的ImageProvider
    2.AssetImage:
    3.NetworkImage:
    4.FileImage:
  * */
    AssetImage("asset/image/qingwa.jpg");
    NetworkImage("https://ss0.baidu.com");
    FileImage(File("path"));


    // ImageProvider是方案  、、、、Image是widget

    //Image的构造函数
    Image();

    //Image的命名构造函数
    Image.file(File("/asset/image/qingwa.jpg"));
    Image.asset("asset/image/qingwa.jpg");
    Image.network("https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/9c16fdfaaf51f3de9ba8ee1194eef01f3a2979a8.jpg");
    return Container(
      child: Image(
        image: AssetImage("asset/image/qingwa.jpg"),
        width: 200.0,
        height: 200.0,
        fit: BoxFit.contain,
        // repeat: ImageRepeat.repeatY,
        // frameBuilder: (  BuildContext context,
        //     Widget child,
        //     int frame,
        //     bool wasSynchronouslyLoaded){
        //     return Text("frameBuilder");
        // },
        // loadingBuilder: (
        //     BuildContext context,
        //     Widget child,
        //     ImageChunkEvent loadingProgress){
        //     return Text("loadingBuilder");
        // },
        // errorBuilder: (
        //     BuildContext context,
        //     Object error,
        //     StackTrace stackTrace){
        //       return Text("errorBuilder");
        // },
        // semanticLabel: "semanticLabel", //用来描述图片的，无足轻重
        alignment: Alignment.centerLeft, //图像边界内对齐图像
        filterQuality: FilterQuality.low,
        // centerSlice: Rect.fromCenter(), //九片图像的中心切片
        isAntiAlias: false,
        gaplessPlayback: false, //当图像提供者发生变化时，是继续显示旧图像（true）还是暂时不显示（false）
        matchTextDirection: false, //是否在图像的方向上绘制图像 TextDirection
        excludeFromSemantics: false,
      ),
    );
  }
}
/* 圆角图片
Image 是不支持圆角和阴影的，目前可以通过使用 CircleAvatar 和 Container 实现。
* */
class myRoundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("asset/image/qingwa.jpg"),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("asset/image/qingwa.jpg"),
                fit: BoxFit.cover,
              )
          ),
          width: 50,
          height: 50,
        )
      ],
    );
  }
}

/* 占位图片
*
* */
class myFadeInImage extends StatelessWidget {
  final String images = "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/w=580/sign=78a22cf75fb5c9ea62f303ebe538b622/ce845b43fbf2b211df2a9fb2ce8065380dd78e06.jpg";
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage("asset/image/haha.gif"),
      image: NetworkImage(images),
      fit: BoxFit.cover, // 图片拉伸模式
      width: 200,
      height: 200,
      fadeInDuration: Duration(milliseconds: 100),
      fadeOutDuration: Duration(milliseconds: 100),
    );
  }
}

class myIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: null,
      image: NetworkImage("images"),
    );
  }
}
