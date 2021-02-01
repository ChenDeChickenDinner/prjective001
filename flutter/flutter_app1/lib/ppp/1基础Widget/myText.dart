import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("appBar")),
      body: Container(
        child: Center(
          child: homePage(),
        ),
      ),
    ),
  ));
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myTextSpan();
  }
}



class myText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "The amount of space (in logical pixels) to add at each sequence of white-space (i.e. between each word)",
      style: TextStyle(
        fontFamily: "Courier", //字体

        color: Colors.blue,
        backgroundColor: Colors.orange,
        fontSize: 22.0,
        // fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制
        fontWeight: FontWeight.w100,
        //字体大小
        fontStyle: FontStyle.italic,
        //字体粗细
        height: 0.0,
        //该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
        decoration: TextDecoration.underline,
        //下划线
        decorationColor: Colors.black,
        //下划线 颜色
        decorationStyle: TextDecorationStyle.dashed,
        //下划线 风格
        letterSpacing: 2.0,
        //每个字母之间要添加的空间量
        wordSpacing: 2.0,
        //每个单词之间要添加的空间量
        shadows: [
          Shadow(
              color: Colors.orange, blurRadius: 2.0, offset: Offset(1.0, 2.0))
        ],
        textBaseline: TextBaseline.ideographic,
        // foreground: Paint(),
        // background: Paint(),
        // fontFeatures: [FontFeature("123")],
        inherit: false, //.不继承默认样式
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      // 截断方式

      textWidthBasis: TextWidthBasis.parent,
      textHeightBehavior: TextHeightBehavior.fromEncoded(1),
      textScaleFactor: 1.0,
      //代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，它是调整字体大小的一个快捷方式
      softWrap: false,
      // 文本是否应在换行符处中断
      strutStyle: StrutStyle(),
    );
  }
}
class myTextSpan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          children: [
            TextSpan(text: "home:"),
            TextSpan(text: "https://flutterchina.club",style: TextStyle(color: Colors.orange),)]
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}